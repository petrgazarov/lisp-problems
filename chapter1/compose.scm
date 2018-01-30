;;; composes two functions f and g such as (f(g x))

(define (compose f g)
  (lambda (x) (f (g x))))
