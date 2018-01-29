;;; Product function - iterative version

(define (product term a next b)
  (define (iter a result)
      (if (> a b)
          result
          (iter (next a) (* result (term a)))))
  (iter a 1))

(define (cube x) (* x x x))
(define (inc n) (+ n 1))
(define (product-cubes a b)
  (product cube a inc b))

(display (product-cubes 1 3))
