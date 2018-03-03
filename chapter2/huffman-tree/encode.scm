;;; encodes a text message using sample-tree

(load "huffman-tree/selectors.scm")
(load "huffman-tree/sample-tree.scm")
(load "huffman-tree/sample-message.scm")
(load "exists-text-element.scm")

(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
        ((exists-text-element? symbol (symbols (left-branch tree))) (cons 0 (encode-symbol symbol (left-branch tree))))
        ((exists-text-element? symbol (symbols (right-branch tree))) (cons 1 (encode-symbol symbol (right-branch tree))))
        (else (error "bad symbol -- ENCODE-SYMBOL" symbol))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(display (encode sample-decoded-message sample-tree))
