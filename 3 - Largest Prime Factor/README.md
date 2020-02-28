#Problem 3 - Largest Prime Factor
```lisp
;;;;Compile #'factors for tail-recursion optimization to avoid stack overflow.

;;;Return T if n is prime, nil otherwise.
(defun primep (n)
  (if (and (evenp n) (not (= 2 n)))
    nil
    (let ((m (floor (sqrt n))))
      (loop
	(when (zerop (mod n m)) (return nil))
	(decf m)
  	(when (= 1 m) (return t))))))

;;;Return a list of factors of n in the range (1, n).
(defun factors (n &optional (m (floor (sqrt n))) ans)
  (if (= 1 m)
    ans
    (multiple-value-bind (a b) (floor n m)
      (if (zerop b)
        (if (= m a)
          (factors n (1- m) (cons m ans))
          (factors n (1- m) (cons a (cons m ans))))
	(factors n (1- m) ans)))))

;;;Return the max value of the list of primes generated from the list of factors of the target.
(defun run-test ()
  (apply #'max (remove-if (complement #'primep) (factors 600851475143))))
```