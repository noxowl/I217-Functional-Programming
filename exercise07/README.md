# I217: Functional Programming
## 7. Multisets
### Exercises
1. Write all programs (or formal specifications) in the slides, feed them into the CafeOBJ system, and observe the results returned by the CafeOBJ system.
2. Revise the two kinds of the programs (or formal specifications) of TAS such that there are four threads participating in the protocol, where one uses records to represent states and the other uses multisets to represent states, feed the revised versions into the CafeOBJ system, and observe the results returned by the CafeOBJ system.
3. Make comparison of the two ways to represent states, where one uses records and the other uses multisets.
4. Draw a diagram for Qlock when there are two threads participating in Qlock like the one shown on p.23 for TAS.
5. How many reachable states does FQlock have? Describe what can support your answer? Hint – see the following Project Report: http://hdl.handle.net/10119/18917
6. Experiment how much time it will take to complete the model checking that TAS and Qlock satisfy the mutex property as the number of threads increases.
7. Investigate the state explosion problem in model checking.
8. Investigate some techniques that can mitigate the state explosion in model checking.
9. Investigate narrowing in which unification is used instead of pattern matching.
10. The search predicate can be used to model check that mutex protocols, such as TAS, satisfy the mutex property when a small fixed number of threads participate in the protocols, but cannot be used to do so when an arbitrary number of threads do so. Narrowing can solve the problem. Investigate some techniques based on narrowing that can be used to model check that mutex protocols satisfy the mutex property when an arbitrary number of threads participate in the protocols. Note that Maude, a sibling language of CafeOBJ, supports narrowing and gives some commends based on narrowing.
11. Investigate linear temporal logic (LTL), Kripke structures (an extension of state machines), the semantics of LTL based on Kripke structures, the Maude LTL model checker, and conduct case studies in which TAS and Qlock enjoy some liveness properties, say, the lockout freedom property that whenever a process wants to enter the critical section, it will eventually be in the critical section.
12. Investigate MCS mutex protocol and Suzuki‐Kasami distributed mutex protocol, and conduct case studies that the protocols enjoy both the mutex property and the lockout freedom property.
