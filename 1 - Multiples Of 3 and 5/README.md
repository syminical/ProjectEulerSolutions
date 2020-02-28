# Problem 1 - Multiples of 3 and 5
```lisp
;;; Return true if i is a multiple of a number in lst.
(defun multp (i lst)
  (if (not lst) nil
    (if (zerop (mod i (car lst)))
      t
      (multp i (cdr lst)))))
      
;;; Return list of multiples in the range [i, n] of numbers in lst. i = 1 by default.
(defun mults-of-lst (lst n &optional (i 1) ans)
  (if (> i n)
    ans
    (mults-of-lst lst n (+ 1 i) (if (multp i lst)
	           		  (cons i ans)
   				  ans))))
                  
;;; The actual program. :)
(format t "~a~%" (reduce #'+ (mults-of-lst '(3 5) 999))) ; display & run
```
