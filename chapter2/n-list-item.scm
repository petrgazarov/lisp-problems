;;; get n-th item from the list (list is 0-indexed)

(define (n-list-item n seq)
  (if (= n 0)
      (car seq)
      (n-list-item (- n 1) (cdr seq))))
