# I217-Functional-Programming
Practice codes of JAIST Course I217 Functional Programming written in CafeOBJ

## 한국어 정리
CafeOBJ는 대수적 명세(specification)및 검증(verification) 언어이다. 튜링 완전하나 소프트웨어 시스템(프로그램, 프로토콜, 인터랙션 사양)의 대수적 명세를 표현하는 것을 목적으로 한다. 명세를 위한 언어이나, 검증 언어이기도 하기 때문에, CafeOBJ로 작성된 명세를 동일한 환경에서 검증할 수 있다.

* 명세(specification): 소프트웨어 시스템의 내부 작동을 수학적 방식으로 설명하는 것.
* 검증(verificaiton): 명세에 대한 수학적 증거를 제공하는 것.

### Sorts
Lisp의 Atom, List와 같이 CafeOBJ에서는 임의의 Sort들을 허용한다. Sort에는 Sort가 지정될 수 있고, 한 Sort는 다른 Sort의 하위 Sort로 선언될 수 있다. 예를 들어,

```
[ Pair ]
```

_Pair_ 라는 다른 Sort와 Sub-sort 관계가 없는 새로운 Sort를 선언할 수 있다. 여기에 Sort를 지정하려는 경우, 다음과 같이 Sort의 정의와 Sort를 함께 표현할 수 있다.

```
[ Nat < Set ]
```

이는 새 Sort _Set_ 을 선언하며, 이를 (Built-in)Sort _Nat_ 의 Super-sort로 선언한다.

_Nil_ 은 빈 Sort 에 대응한다.

#### 보족
Sort = Data Type 으로 이해할 수 있다. 예를 들어 자연수 NAT 안의 Sorts는 다음과 같은 그래프 구조를 가진다.

```
  ?Nat
    |
   Nat
  /   \
Zero   NzNat
        |
       Nat
```

* *Super-Sort*: Sort들을 포괄하기 위해 존재하는 특정 Sort들의 상위 Sort이다. Nat, Zero, NzNat은 모두 ?Nat의 Sub-Sort로 간주할 수 있다. ?Nat와 같은 특수한 Super-sort는 CafeOBJ가 자동으로 생성한다.
* *Error-Sort*: Super-sort는 Sub-Sort들의 연산에 대해 정의되지 않은 연산이 발생할 경우 Sub-Sort 대신 반환된다. 예를 들어, NzNat에 대한 연산에서 Equation이 정의되지 않았거나 방정식 자체에 문제가 있는 경우 ?Nat Sort가 반환된다.

Sort 간의 계층 구조는 다음과 같이 선언할 수 있다.
```
[Nat ErrNat < Nat&Err]
```
이 구문은 Nat과 ErrNat 두 Sort가 Nat&Err라는 단일 Super-sort의 하위 Sort임을 나타낸다. 즉, Nat&Err Sort를 반환하는 방정식에서 결과는 Nat 또는 ErrNat 둘 중 하나가 될 수 있다는 표현을 하나의 출력으로 할 수 있게 된다.

이를 통해 Sort의 역할이 다음과 같음을 알 수 있다.
* 데이터 타입을 정의한다. (Lisp에서의 Atom + List 들을 모두 포괄한다.)
* 데이터의 유효성을 검증한다. (타입 시스템으로써 동작한다.)
* 함수와 연산을 정의하는데 사용한다. (op fib : Nat -> Nat . 함수는 Nat sort를 입력으로 하여 Nat sort를 출력으로 한다.)
* Super-Sub의 그래프 구조를 통해 데이터간의 계층 구조를 표현할 수 있다.

### Imports
CafeOBJ에서는 이미 정의한 모듈을 불러오고 재사용 할 수 있다.

```
pr(NAT)
```

위의 코드는 CafeOBJ에 내장된 자연수의 집합(Set, CafeOBJ적으로는 Sort)을 불러온다. 페아노 공리계에 따라 0은 자연수의 집합에 포함된다.

즉:

```
NAT -> {0, 1, 2, 3, ...}
NzNAT -> {1, 2, 3, ...}
Zero -> {0}
```

### 변수(Variables)와 연산자(Operators)
변수는 특정 유형의 객체를 보유하고, 연산자는 기능을 정의한다. 변수에는 유효한 종류의 Sort가 선언되어야 하며, 동일한 유형의 변수는 vars로 한번에 선언할 수 있다. 선언된 연산자에는 입력과 출력 데이터의 종류를 표현하는 서명(Signature)이 제공되어야 한다. 

```
var X : Nat
vars Y Z : NzNat
op sum : Nat Nat -> NzNat
op power : Nat -> Nat
```

연산자는 아래와 같은 방식으로도 선언될 수 있다.

```
op _sum_ : Nat Nat -> NzNat
```

여기서 밑줄(_)은 연산자에 대한 인자를 나타내며, 밑줄의 수가 이후에 제공된 Signature의 입력 개수와 일치해야 한다. 이는 ```CafeOBJ> 3 sum 4 .``` 와 같이 호출할 수 있게 된다.

### 항(Terms, Terminology)
위에서 정의한 Sorts, Variables, Operators 들을 통틀어 Terms 라고 한다. 이후에 서술될 Term Rewriting System(TRS)을 통해 Term f(a)를 Term g(a) 로 변환할 수 있다. TRS에서는 Rule l -> r 의 형태로 term을 변환하고, Rewriting은 이 rule을 적용하여 term을 변환하는 과정을 말한다.

### 방정식(Equations)과 공리(Axioms)
위에서 정의된 연산자에 대한 행동을 정의한다. 이를 통해 서로 다른 Terms를 equate 할 수 있게 된다. CafeOBJ 에서의 Axioms는 Equations의 형태로 표현된다.

```
eq power(0) = 1 .
eq power(X) = X * X .
```

### Modules
CafeOBJ의 모듈은 _mod!_ 와 _mod&ast;_ 키워드로 정의된다. 위에서 언급된 Term들을 캡슐화하여 시스템의 특정 부분을 정의할 수 있다. 위에서 언급된 Imports의 ```pr(MODULE_NAME)``` 을 통해 모듈 안에서 특정 모듈의 정의를 사용할 수도 있다.

mod! 키워드는 Operator가 포함된 모듈을 정의한다. 이외의 Terms들을 포함할 수 있으며, Rewrite rule을 포함할 수 있다.

```
mod! GLIST1(E :: TRIV) {
  [Nil NnList < List]
  op nil : -> Nil {constr} .
  op _|_ : Elt.E List -> NnList {constr} .
  op _@_ : List List -> List .
  ...
}
```

mod\* 키워드는 파라미터화된 모듈을 정의하는데 사용한다. 추상화 수준을 높일 수 있다.

```
mod* GLIST2(E :: TRIV) {
  pr(LIST(E))
  ...
}
```

### 파라미터화 된 모듈(Parameterized Modules)
모듈을 정의할 때 특정 타입이나 연산에 대한 파라미터를 받아, 이를 기반으로 모듈을 생성할 수 있게 한다. 구체적인 데이터 타입이나 연산자 대신 제네릭을 사용하여 유연성과 재사용성을 높인다. 템플릿과 제네릭 프로그래밍과 유사하다.

```
mod* MODULE_NAME(E :: PARAMETER) {
  -- 모듈 내용
}
```

파라미터화 된 모듈 TRIV-ERR를 통해 LIST를 정의한다고 하자. 아래와 같다.

```
mod* TRIV-ERR {
  [Elt Err < Elt&Err]
  op err : -> Err {constr} .
}

view TRIV-ERR2ENTRY from TRIV-ERR to ENTRY {
  sort Elt -> Entry,
  sort Err -> ErrEntry,
  sort Elt&Err -> Entry&Err,
  op err -> errEntry
}

mod! LIST(M :: TRIV-ERR) {
  pr(NAT-ERR)
  [List]
  op nil : -> List {constr} .
  op _|_ : Elt.M List -> List {constr} .
  op _@_ : List List -> List {r-assoc} .
  op nth : List Nat&Err -> Elt&Err.M .
  op len : List -> Nat .
  vars X Y : Elt.M .
  vars L L1 : List .
  var N : Nat .
  var NzN : NzNat .
  ...
}

mod! USE-LIST {
  pr(LIST(M <= TRIV-ERR2ENTRY)) -- LIST 모듈을 TRIV-ERR2ENTRY로 인스턴스화
}
```

### Views & Instantiation
View는 한 모듈의 사양을 다른 모듈에 매핑하는데 사용한다. 이를 통해 두 모듈 사이의 상관관계가 정의되고, View를 참조하는 모듈이 참조되는 모듈의 특정 부분을 활용할 수 있게 된다. View 정의를 통해 생성된 View는 해당 View 이름으로 인스턴스화 된다. 사용은 다음과 같다.

```
view VIEW_NAME from SOURCE_MODULE to TARGET_MODULE {
  sort SOURCE_SORT1 -> TARGET_SORT1 .
  ...
  op SOURCE_OP1 -> TARGET_OP1 .
  ...
}
```

구체적인 예로 generic_list 의 코드를 참고하자.

```
view TRIV-ERR2NAT-ERR from TRIV-ERR to NAT-ERR {
  sort Elt -> Nat,
  sort Err -> ErrNat,
  sort Elt&Err -> Nat&Err,
  op err -> errNat,
}
```

* TRIV-ERR의 Elt sort를 NAT-ERR의 Nat sort와 ErrNat sort에 대응시킨다.
* TRIV-ERR의 Elt&Err sort를 NAT-ERR의 Nat&Err sort에 대응시킨다.
* TRIV-ERR의 err Operator를 NAT-ERR의 errNat operator에 대응시킨다.
* 이를 통해 TRIV-ERR의 요소를 NAT-ERR의 요소로써 대응시킬 수 있게 된다.

CafeOBJ의 View는 인터페이스, 타입 변환, 추상화 계층 매핑과 유사하다고 이해할 수 있다. Haskell에서는 타입 클래스 정의/타입 클래스의 인스턴스 정의가 그러하고, C++의 템플릿/템플릿 특수화가 그러하며, Python의 ABC도 어느 정도 비슷하다고 볼 수 있다.

### Tutorial: Lists
CafeOBJ의 문법으로 리스트를 정의하고 사용할 수 있다.(lecture 2의 NATLIST, NAT-ERR에 대응)

```
mod! LIST {
    pr(NAT)
    [List]
    op nil : -> List {constr} .
    op _|_ : Nat List -> List {constr} .
}
```

nil을 빈 리스트에 대응시키고, | 연산자를 이용해 괄호를 생략할 수 있게 된다. 즉, 1 | ( 3 | ( 2 | nil )) 의 리스트는 1 | 3 | 2 | nil 로 간단하게 표현할 수 있다. 리스트의 마지막 요소는 항상 nil이어야 하며, 1 | 3 | 2 와 같은 형태는 리스트로써 파싱되지 않는다. 이를 실제로 cafeOBJ에서 실행한다면:

```
CafeOBJ> open LIST .
...
%LIST> red 1 | 3 | 2 | nil .
-- reduce in %LIST : (1 | (3 | (2 | nil))):List
(1 | (3 | (2 | nil))):List
%LIST> close
CafeOBJ>
```

위의 코드에서 ```_|_```는 Nat Sort와 List Sort를 입력으로 하여 List를 반환한다. 여기서 List가 nil이 아닌 자연수의 List임을 명시적으로 보장하고 싶을 수도 있다. 그러한 사양을 코드로 다시 표현한다면: 

```
mod! NN-NATLIST {
    [Nil NnNatList <  NatList]
    op nil : -> Nil {constr} .
    op _|_ : Nat NatList -> NnNatList {constr} .
}
```

위의 코드를 통해 ```_|_``` 을 통해 만들어진 리스트가 Non-nil임이 보장되는 NatList를 명시적으로 선언할수 있게 된다.

## References
- [1] R. Diaconescu and K. Futatsugi, Cafeobj Report, vol. Volume 6. in AMAST Series in Computing, no. Volume 6, vol. Volume 6. WORLD SCIENTIFIC, 1998. doi: 10.1142/3831.
- [2] R. Diaconescu and K. Futatsugi, “Logical foundations of CafeOBJ,” Theoretical Computer Science, vol. 285, no. 2, pp. 289–318, Aug. 2002, doi: 10.1016/S0304-3975(01)00361-9.
- [3] CafeOBJ Official Website, [cafeobj.org](https://cafeobj.org/).
