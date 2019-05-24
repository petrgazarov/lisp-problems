;;; Recursive equal? that checks both lists and symbols

(define (customEqual? el1 el2)
  (if (and (list? el1) (list? el2))
      (if (and (= (length el1) 0) (= (length el2) 0))
          true
          (and (= (length el1) (length el2))
               (eq? (car el1) (car el2))
               (customEqual? (cdr el1) (cdr el2))))
      (eq? el1 el2)))
