;;; Takes two arguments, a symbol and a list.
;;; If the symbol is not contained in the list (i.e., is not eq? to any item in the list),
;;; then memq returns false. Otherwise, it returns the sublist of the list
;;; beginning with the first occurrence of the symbol.

(define (memq item x) (cond ((null? x) false)
  ((eq? item (car x)) x) (else (memq item (cdr x)))))
