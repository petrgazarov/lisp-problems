;;; Explain how the following statement is evaluated by the interpreter:

(car ''abracadabra)

  ; To invoke a procedure, we usually write a list with the first element
  ; being the name of the procedure and consequtive elements being arguments to the procedure.
  ; ' is a shorthand for the "quote" procedure, therefore
  ; ''abracadabra is equivalent to saying '(quote abracadabra) or (quote (quote abracadabra)).
  ; Quoting the invocation of the "quote" procedure returns "(quote <arg>)", which is a list.
  ; We call car procedure on this list, and get back the first element, "quote".
