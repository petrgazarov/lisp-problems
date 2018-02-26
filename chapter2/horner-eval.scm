;;; evaluates a polynomial at x using horner algorithm

(load "accumulate.scm")

(define (horner-eval x coefficient-sequence)
    (+ (car coefficient-sequence) (accumulate (lambda (this-coeff higher-terms) (* (+ this-coeff higher-terms) x))
          0
          (cdr coefficient-sequence))))

(display (horner-eval 2 (list 1 3 0 5 0 1)))
