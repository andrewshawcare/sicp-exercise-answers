(define (assert description predicate)
  (if predicate
    (display (string-append "✓ " description "\n"))
    (error description)))
