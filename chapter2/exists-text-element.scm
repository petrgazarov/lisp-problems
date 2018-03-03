;;; check if text element exists in list

(define (exists-text-element? val seq) 
  (define (exists-iter seq result)
    (if (null? seq) result
      (let ((c (car seq)))
        (if (eq? c val)
          (exists-iter (cdr seq) true)
          (exists-iter (cdr seq) result)))))
  (exists-iter seq false))
