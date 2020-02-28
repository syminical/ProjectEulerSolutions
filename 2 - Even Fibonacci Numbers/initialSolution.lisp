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
                     
;;;Display sum of even values from key/value pairs in hash-table from #'fib-lst.
(format t "~a" (reduce #'+ 
		 (remove-if #'oddp 
                   (loop for val
 		     being the hash-values of (fib-lst 4000000)
		       collect val))))
