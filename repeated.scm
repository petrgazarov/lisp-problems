;;; Returns a function that, when called, calls the original function f n times
;;; passing the result of each function call as an argument to the next function call

(load "compose.scm")

(define (repeated f n)
  (define (repeat-iter f n result)
    (cond ((= n 1) result)
          (else (repeat-iter f (- n 1) (compose f result)))))
  (repeat-iter f n f))
