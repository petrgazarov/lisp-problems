;;; returns the last argument of the given (non-empty) list

(define (last-pair list-arg)
  (if (null? (cdr list-arg)) (car list-arg)
    (last-pair (cdr list-arg))))

(display (last-pair (list 23 72 149 34)))
