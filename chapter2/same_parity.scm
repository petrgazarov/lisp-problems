;;; Selects from the numbers in the list those with same parity as 'n'.
;;; There can be any number of arguments args

(define (same-parity n . args)
  (define (select-same-parity select-function list-arg result)
    (if (null? list-arg) result
      (if (select-function (car list-arg))
        (select-same-parity select-function (cdr list-arg)
          (append result (list (car list-arg))))
        (select-same-parity select-function (cdr list-arg) result))))
  (if (even? n)
    (select-same-parity even? args (list n))
    (select-same-parity odd? args (list n))))

; (display (same-parity 1 2 3 4 5 6 7))
(display (same-parity 2 3 4 5 6 7))
