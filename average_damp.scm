;;; Returns a function that averages out x and f(x)
;;; where f is the original function argument

(load "average.scm")

(define (average-damp f)
  (lambda (x) (average x (f x))))
