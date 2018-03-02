(load "enumerate-interval.scm")
(load "flatmap.scm")
(load "filter.scm")
(load "n-list-item.scm")

;;; returns a list of board-size empty lists
(define (empty-board board-size)
  (map (lambda (x) '()) (enumerate-interval 1 board-size)))

;;; we adjoin a new queen to an existing board rest-of-queens
(define (adjoin-position row col rest-of-queens)
  (define (adjoin-position-iter counter result board)
    (cond ((null? board) result)
          ((= counter col) (adjoin-position-iter (+ counter 1) (append result (list row)) (cdr board)))
          (else (adjoin-position-iter (+ counter 1) (append result (list (car board))) (cdr board)))))
  (adjoin-position-iter 1 () rest-of-queens))

;;; Checks if the queen places on column k is safe in respect to other queens.
;;; Whole-board is a list of one board position
(define (safe? k whole-board)
  (define k-val (n-list-item (- k 1) whole-board))
  (define (safe-iter result counter board)
    (cond ((null? board) result)
          ((= counter k) result)
          ((null? (car board)) (safe-iter result (+ counter 1) (cdr board)))
          ((or (= (car board) k-val) (= (- (+ (car board) k) counter) k-val) (= (+ (- (car board) k) counter) k-val)) (safe-iter false (+ counter 1) (cdr board)))
          (else (safe-iter result (+ counter 1) (cdr board)))))
  (safe-iter true 1 whole-board))

;;; returns a list of solutions to the puzzle
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list (empty-board board-size))
        (filter
          (lambda (board) (safe? k board))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(display (length (queens 8)))
