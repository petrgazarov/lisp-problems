;;; Product function - recursive version

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))
      ))

(define (cube x) (* x x x))
(define (inc n) (+ n 1))
(define (product-cubes a b)
  (product cube a inc b))

(display (product-cubes 1 3))
