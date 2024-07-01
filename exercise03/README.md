# I217: Functional Programming
## 3. Term Rewriting
### Exercises
1. Let us consider the module NATLIST. Write the traces of reductions of the following terms:
    1. hd(0|1|nil)
    2. tl(0|1|nil)
    3. [2..5]
2. Let us consider the module GCD. Write the trace of reduction of gcd(24,36).
3. Let us consider the module FACT. Write the trace of reduction of fact(5).
4. Let us consider the module OEDC-FACT. Write the trace of reduction of oedc-fact(5).
5. Let us consider the module QSORT. Write the trace of reduction of qsort(2 | 1 | 0 | 3 | 4 | nil).
6. Let us consider the module ERATOSTHENES‐SIEVE. Write the trace of reduction of primesUpto(6).
* Note that each equation used should be given a unique name and you can use the following pseudo‐equations as rewrite rules.
    * eq X rem NzX = remainder of dividing X by NzX . (rem)
    * eq X < Y = true if so & false otherwise . (<)
    * eq X > Y = true if so & false otherwise . (>)
    * eq NzX divides X = true if X is a multiple of NzX & false otherwise . (divides)
    * eq X * Y = multiplication of X and Y . (*)
    * eq sd(X,Y) = symmetric difference (| X – Y |) between X and Y . (sd)
    * eq p NzX = the previous number of NzX . (p)
    * eq X + Y = addition of X and Y . (+)

----

7. Investigate lambda calculus, which is often used as the basis of many functional programming languages and make a comparison of it with term rewriting.
8. Investigate higher‐order functions and how to implement them.
9. Investigate how to implement term rewriting and CafeOBJ.
10. Investigate how to implement lambda calculus and some other functional programming languages based on the calculus, for example, by reading the book “Daniel P. Friedman, Mitchell Wand: Essentials of programming languages (3. ed.). MIT Press 2008.”
11. Investigate term rewriting furthermore, for example, by reading the book “Terese: Term Rewriting Systems. Cambridge University Press 2003.”
