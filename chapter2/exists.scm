;;; check if element exists in list

(define (exists? val seq) 
  (define (exists-iter seq result)
    (if (null? seq) result
      (let ((c (car seq)))
        (if (= c val)
          (exists-iter (cdr seq) true)
          (exists-iter (cdr seq) result)))))
  (exists-iter seq false))

(display (exists? 4 (list 1 2 3 4 5)))
