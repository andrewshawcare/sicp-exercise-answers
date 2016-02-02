(display "Structure and Interpretation of Computer Programs\n")

(assert "Exercise 1.1.1"
  (= 10 10))

(assert "Exercise 1.1.2"
  (= (+ 5 3 4) 12))

(assert "Exercise 1.1.3"
  (= (- 9 1) 8))

(assert "Exercise 1.1.4"
  (= (/ 6 2) 3))

(assert "Exercise 1.1.5"
  (=
    (+ (* 2 4) (- 4 6))
    6))

(assert "Exercise 1.1.6"
  (and
    (define a 3)
    (= a 3)))

(assert "Exercise 1.1.7"
  (and
    (define b (+ a 1))
    (= b 4)))

(assert "Exercise 1.1.8"
  (=
    (+ a b (* a b))
    19))

(assert "Exercise 1.1.9"
  (equal?
    (= a b)
    #f))

(assert "Exercise 1.1.10"
  (=
    (if
      (and
        (> b a)
        (< b (* a b)))
      b a)
    b))

(assert "Exercise 1.1.11"
  (=
    (cond
      ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
    16
  )
)

(assert "Exercise 1.1.12"
  (=
    (+ 2 (if (> b a) b a))
    6
  )
)

(assert "Exercise 1.1.13"
  (=
    (*
      (cond
        ((> a b) a)
        ((< a b) b)
        (else -1)
      )
      (+ a 1)
    )
    16
  )
)
