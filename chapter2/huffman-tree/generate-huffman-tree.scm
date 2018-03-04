;;; generate a huffman tree using a set of symbol-frequency pairs

(load "huffman-tree/selectors.scm")
(load "huffman-tree/make-leaf.scm")
(load "huffman-tree/make-code-tree.scm")

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

;;; sorts pairs in ascending order
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair) ; symbol
                               (cadr pair)) ; frequency
                    (make-leaf-set (cdr pairs))))))

;;; sorts partial trees based on weight
(define (set-sort-function x y) (< (weight x) (weight y)))

(define (successive-merge sets)
  (if (= (length sets) 1)
      sets
      (let ((sorted-sets (sort sets set-sort-function)))
           (let ((merged-set (make-code-tree (car sorted-sets) (cadr sorted-sets))))
           (successive-merge (append (list merged-set) (cddr sorted-sets)))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(display (generate-huffman-tree (list '(A 4) '(B 2) '(C 1) '(D 1))))
