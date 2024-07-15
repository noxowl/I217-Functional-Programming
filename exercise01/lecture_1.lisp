;; Factorial
(defun fact (n)
    (if (= n 0)
        1
        (* n (fact (- n 1)))
    )
)

(print "Factorial: (fact 10)")
(print (fact 10))

;; Odd-Even Devide and Conquer Factorial

(defun oedc-fact-sub (n m)
    (if (> n m)
        (* (oedc-fact-sub n (* m 2)) (oedc-fact-sub (abs (- n m)) (* m 2)))
        n
    )
)

(defun oedc-fact (n)
    (if (= n 0)
        1
        (oedc-fact-sub n 1)
    )
)

(print "Odd-Even Devide and Conquer Factorial: (oedc-fact 10)")
(print (oedc-fact 10))

;; Summation

(defun sum (n)
    (if (= n 0)
        0
        (+ n (sum (- n 1)))
    )
)

(print "Summation: (sum 1024)")
(print (sum 1024))

;; Odd-Even Devide and Conquer Summation

(defun oedc-sum-sub (n m)
    (if (> n m)
        (+ (oedc-sum-sub n (* m 2)) (oedc-sum-sub (abs (- n m)) (* m 2)))
        n
    )
)

(defun oedc-sum (n)
    (if (= n 0)
        0
        (oedc-sum-sub n 1)
    )
)

(print "Odd-Even Devide and Conquer Summation: (oedc-sum 1024)")
(print (oedc-sum 1024))

;; Ext-Fibonacci

(defun ext-fib (n)
    (if (= (truncate n 3) 0)
        n
        (+ (ext-fib (- n 1)) (ext-fib (- n 2)) (ext-fib (- n 3)))
    )
)

(print "Ext-Fibonacci: (ext-fib 7)")
(print (ext-fib 7))

;; Ackermann Function

(defun ackermann (m n)
    (if (= m 0)
        (+ n 1)
        (if (= n 0)
            (ackermann (- m 1) 1)
            (ackermann (- m 1) (ackermann m (- n 1)))
        )
    )
)

(print "Ackermann Function: (ackermann 3 4)")
(print (ackermann 3 3))
;; (print "Ackermann Function: (ackermann 5 5)")
;; (print (ackermann 5 5)) ;; Control stack exhausted

;; Takeuchi Function

(defun tak (x y z)
    (if (< y x)
        (tak (tak (- x 1) y z) (tak (- y 1) z x) (tak (- z 1) x y))
        z   
    )
)

(print "Takeuchi Function: (tak 12 6 0)")
(print (tak 12 6 0))
