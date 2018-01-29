;;; n-th fibonacci number in log-n time

;;; uses the fact that square(F1) + square(F2) where F1 and F2 are consequtive
;;; fibonacci numbers is itself a fibonacci number.

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
        (fib-iter a b
        (+ (square p) (square q))
        (- (+ (square q) (square (+ p q))) (+ (square p) (square q))) (/ count 2)))
                (else (fib-iter (+ (* b q) (* a q) (* a p))
                                (+ (* b p) (* a q))
                                p
                                q
                                (- count 1)))))

(fib 16)
