# I217: Functional Programming
## 6. Infinite Lists
### Exercises
1. Write all programs in the slides and feed them into the CafeOBJ system. Moreover, write some more test code and do some more testing for the programs.
2. Revise the simulator (including the revised one) so that it can deal with the case in which there are four threads.
3. CafeOBJ automatically gives a local strategy to an operator when a programmer does not explicitly give any local strategies to the operator. Investigate how CafeOBJ does so.
4. Lazy evaluation corresponds to outermost strategies and is adopted by some functional programming languages, such as Haskell. Lazy evaluation is convenient because it makes it possible to deal with infinite lists as you have learned in this lecture note, but is not good from a running performance point of view. Thus, strictness analysis is often used. Investigate strictness analysis.
5. Investigate why eager evaluation (or call‐by‐value) can be more efficiently implemented than lazy evaluation from a running performance point of view. Come up with an efficient way to implement lazy evaluation.
6. How to deal with infinite lists in this lecture note is rather casual. One possible way to precisely deal with infinite data structures, such as infinite lists, is co‐induction. Investigate co‐ induction and how to deal with infinite lists with co‐induction. Note that all data structures that are inductively defined are finite, such as terms and ordinary lists.
7. Investigate hidden algebra (or behavioral specifications) that has something to do with co‐induction. Note that hidden algebra is one theoretical basis of CafeOBJ.
