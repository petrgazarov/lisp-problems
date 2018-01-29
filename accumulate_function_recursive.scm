;;; Accumulate function - generalization of lower level functions such as product and sum

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))
      ))

(define (cube x) (* x x x))
(define (inc n) (+ n 1))

(display (accumulate * 1 cube 1 inc 3))
