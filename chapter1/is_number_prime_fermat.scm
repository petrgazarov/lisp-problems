;;; Using Fermat's probabilistic algorithm
;;; Some numbers known as Carmichael numbers can fool Fermat test.
;;; The smallest few are 561, 1105, 1729, 2465, 2821, and 6601.
;;; In testing primality of very large numbers chosen at random,
;;; the chance of stumbling upon a value that fools the Fermat
;;; test is less than the chance that cosmic radiation will cause
;;; the computer to make an error in carrying out a ‘‘correct’’ algorithm.

(load "expmod.scm")

(define (is_number_prime? n)
  (compare_exponent_to_modulo n 1))
(define (compare_exponent_to_modulo n a)
  (cond ((= (- n 1) a) #t)
        ((= (remainder a n) (expmod a n n)) (compare_exponent_to_modulo n (+ a 1)))
        (else #f))
  )

(display (is_number_prime? 6601))
