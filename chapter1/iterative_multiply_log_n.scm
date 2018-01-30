;;; iterative multiplication function, using halve and double helper functions, log(n) time

(define (double n) (+ n n))

(define (halve n) (/ n 2))

(define (* a b)
  (iter-multiply a b 0))
(define (iter-multiply a b result)
  (if (= b 0)
      result
      (if (even? b)
          (iter-multiply (double a) (halve b) result)
          (iter-multiply a (- b 1) (+ result a)))))

(* 5 10)
