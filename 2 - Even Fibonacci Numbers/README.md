#Problem 2 - Even Fibonacci Nums
I have two solutions for this problem. The one that got me the answer, and then a better one I put together after reading posts in the solutions thread. :)
####My initial solution:
```clojure
;;;Returns a hash table with the values of fib in the range (1, n).
(defun fib-lst (n &optional (i 0) (mem (make-hash-table)) (f-val 0) (p-val 0))
  (cond
    ((>= p-val n) (remhash (1- i) mem) mem)
    ((zerop i) (progn
                 (setf (gethash i mem) 1)
		         (fib-lst n (1+ i) mem 1 1)))
    (t (multiple-value-bind (remem known) (nth-value 1 (gethash i mem))
 	     (unless known
  	     (setf (gethash i mem) (+ f-val p-val)))
      	 (fib-lst n (1+ i) mem p-val (if known
			 	 	                   remem
					                   (+ f-val p-val)))))))
                     
;;;Display sum of even values from key/value pairs in hash-table
;;; from #'fib-lst.
(format t "~a" (reduce #'+ 
		         (remove-if #'oddp 
                   (loop for val
 		             being the hash-values of (fib-lst 4000000)
		               collect val))))
```


####Better, math based, solution (see Begoner's post):
```clojure
(defun fib-sum-even-under-n (n &optional (x 1) (y 1) (ans 0))
  (let ((z (+ x y)))
    (if (>= z n)
      ans
      (fib-sum-even-under-n n (+ x (* 2 y)) (+ (* 2 x) (* 3 y)) (+ ans z)))))

(format t "~a" (fib-sum-even-under-n 4000000))
```

*(EP forum, Thread 2, Pg.1)* **Begoner** said
>...each third number is even. We don't need to calculate the odd numbers.
>Starting from an[y] two odd terms x, y, the series is: x, y, **x + y**, x + 2y, 2x + 3y, **3x + 5y**