(defun fib-sum-even-under-n (n &optional (x 1) (y 1) (ans 0))
  (let ((z (+ x y)))
    (if (>= z n)
      ans
      (fib-sum-even-under-n n (+ x (* 2 y)) (+ (* 2 x) (* 3 y)) (+ ans z)))))

(format t "~a" (fib-sum-even-under-n 4000000))