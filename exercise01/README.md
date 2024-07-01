# I217: Functional Programming
## 1. Sorts, Operators, Terms & Equations
### Exercises
1. Type each piece of programs in the slides as one file, feed it into CafeOBJ, and do some testing. Note that the extension of a file name in which CafeOBJ programs are written is .cafe, such as fact.cafe.
2. Explain in which way fact(5) is computed.
3. Explain in which way oedc‐fact(5) is computed.
4. Write two versions of programs computing the summation 0+1+2+...+n for a given number n, where one corresponds to fact and the other corresponds to oedc-fact and do some testing for both versions.
5. Write a program in CafeoBJ that corresponds to the following and do some testing
    - ext-fib(n)
        1. 0 if n = 0
        2. 1 if n = 1
        3. 2 if n = 2
        4. ext-fib(n–1) + ext-fib(n–2) + ext-fib(n–3) otherwise
    - You should not use _sd_. You should not use any user defined function that does the same thing as _sd_. When you use _p t_, you should explicitly guarantee that the least sort of _t_ is _NzNat_. Hint: you can consult the program of _fib_, where one sub‐function is used to split the natural numbers into (1) _0_, (2) _1_ and (3) _2_ or larger ones. You can use two sub‐ functions to split natural numbers into (1) _0_, (2) _1_, (3) _2_ and (4) _3_ or larger ones.
6. Revise the program in which the factorial function is defined such that instead of fact the following postfix operator is used:
    - op \_! : Nat -> Nat .
7. Revise the program in which the odd‐even divide & conquer factorial function is defined such that instead of oedc-fact and cond the following postfix and mix‐fix operators are used:
    - op \_! : Nat -> Nat .
    - op if_then {\_} else {\_} : Bool Nat Nat -> Nat .
8. Investigate why it takes times to compute Ackerman function with even small natural numbers, such as ack(5,5) and ack(10,10).
9. Find the definition of Takeuchi function, describe it in CafeOBJ and run it with some natural numbers. Investigate why it takes time to compute Takeuchi function with even small natural numbers.
10. Write the programs found in the lecture note in another functional programming language, such as Standard ML, and run them with its processor, such as SML#.
