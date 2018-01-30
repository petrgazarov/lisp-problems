;;; n-th root of x

(load "iterative_exponent_log_n.scm")
(load "repeated.scm")
(load "fixed_point.scm")
(load "average_damp.scm")

(define (nth_root x n)
  (define (nth-try y)
    (/ x (fast-expt y (- n 1))))
  (fixed-point
    (repeated (average-damp (lambda (y) (nth-try y))) 2)
    x))

(display (nth_root 16 3))
