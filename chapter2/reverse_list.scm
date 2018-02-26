;;; reverses a list

(define (reverse list-arg)
  (define (reverse-recur list-arg result)
    (if (null? (cdr list-arg)) list-arg
      (append (reverse-recur (cdr list-arg) result) (list (car list-arg)))))
  (reverse-recur list-arg (list)))

(display (reverse (list 1 2 3 4)))
