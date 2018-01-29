;;; Similar to "find_primes_in_sqrt_n_time.scm", but in (log n) time
;;; Uses Fermat's probibalistic algorithm

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (start-prime-test n (real-time-clock)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (real-time-clock) start-time) n)
      #f))
(define (report-prime elapsed-time n)
  (display (string-append (number->string n) " is prime"))
  (display " *** ")
  (display (string-append "time spent: " (number->string elapsed-time)))
  (newline)
  #t)

(define (search_for_primes start_with)
  (prime_search_iter start_with 3 0))
(define (prime_search_iter n num_of_primes num_found)
  (cond ((= num_of_primes num_found) (newline) (display "finished"))
        ((timed-prime-test n)
          (prime_search_iter (+ n 1) 3 (+ num_found 1)))
        (else (prime_search_iter (+ n 1) 3 num_found)))
  )

(search_for_primes 1000000000000)
