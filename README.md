# I217-Functional-Programming
Practice codes of JAIST Course I217 Functional Programming written in CafeOBJ

## 한국어 정리
CafeOBJ는 대수적 명세(specification)및 검증(verification) 언어이다. 튜링 완전하나 소프트웨어 시스템(프로그램, 프로토콜, 인터랙션 사양)의 대수적 명세를 표현하는 것을 목적으로 한다. 명세를 위한 언어이나, 검증 언어이기도 하기 때문에, CafeOBJ로 작성된 명세를 동일한 환경에서 검증할 수 있다.

* 명세(specification): 소프트웨어 시스템의 내부 작동을 수학적 방식으로 설명하는 것.
* 검증(verificaiton): 명세에 대한 수학적 증거를 제공하는 것.



### Sorts
Lisp의 List와 같이 CafeOBJ에서는 임의의 Sort들을 허용한다. Sort는 순서가 지정될 수 있고, 한 Sort는 다른 Sort의 하위 Sort로 선언될 수 있다. 예를 들어,

```
[ Pair ]
```

_Pair_ 라는 다른 Sort와 Sub-sort 관계가 없는 새로운 Sort를 선언할 수 있다. 여기에 순서를 지정하려는 경우, 다음과 같이 Sort의 정의와 순서를 함께 표현할 수 있다.

```
[ Nat < Set ]
```

이는 새 Sort _Set_ 을 선언하며, 이를 (Built-in)Sort _Nat_ 의 Super-sort로 선언한다.

_Nil_ 은 빈 Sort 에 대응한다.

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
변수는 특정 유형의 객체를 보유하고, 연산자는 기능을 정의한다. 변수에는 유효한 종류의 Sort가 선언되어야 하며, 동일한 유형의 변수는 vars로 한번에 선언할 수 있다. 선언된 연산자에는 입력과 출력 데이터의 종류를 표현하는 Signature가 제공되어야 한다. 

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

### 방정식(Equations)과 공리(Axoims)
위에서 정의된 연산자에 대한 행동을 정의한다. 이를 통해 서로 다른 Terms를 equate 할 수 있게 된다. CafeOBJ 에서의 Axoims는 Equations의 형태로 표현된다.

```
eq power(0) = 1 .
eq power(X) = X * X .
```

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

## References
- [1] R. Diaconescu and K. Futatsugi, Cafeobj Report, vol. Volume 6. in AMAST Series in Computing, no. Volume 6, vol. Volume 6. WORLD SCIENTIFIC, 1998. doi: 10.1142/3831.
- [2] R. Diaconescu and K. Futatsugi, “Logical foundations of CafeOBJ,” Theoretical Computer Science, vol. 285, no. 2, pp. 289–318, Aug. 2002, doi: 10.1016/S0304-3975(01)00361-9.
- [3] CafeOBJ Official Website, [cafeobj.org](https://cafeobj.org/).
