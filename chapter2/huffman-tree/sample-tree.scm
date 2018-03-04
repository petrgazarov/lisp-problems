;;; makes a sample huffman tree

(load "huffman-tree/selectors.scm")
(load "huffman-tree/make-leaf.scm")
(load "huffman-tree/make-code-tree.scm")

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))
