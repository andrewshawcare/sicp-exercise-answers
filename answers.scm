(define (assert message predicate)
  (if predicate message (error message)))

(assert "Exercise 1.1.1"
  (= 10 10))

(assert "Exercise 1.1.2"
  (= (+ 5 3 4) 12))

(assert "Exercise 1.1.3"
  (= (- 9 1) 8))

(assert "Exercise 1.1.4"
  (= (/ 6 2) 3))

(assert "Exercise 1.1.5"
  (= (+ (* 2 4) (- 4 6)) 6))

(define a 3)
(assert "Exercise 1.1.6"
  (= a 3))

(define b (+ a 1))
(assert "Exercise 1.1.7"
  (= b 4))

(assert "Exercise 1.1.8"
  (= (+ a b (* a b)) 19))

(assert "Exercise 1.1.9"
  (equal? (= a b) #f))

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
    16))

(assert "Exercise 1.1.12"
  (=
    (+ 2 (if (> b a) b a))
    6))

(assert "Exercise 1.1.13"
  (=
    (*
      (cond
        ((> a b) a)
        ((< a b) b)
        (else -1))
      (+ a 1))
    16))

(assert "Exercise 1.2"
  (=
    -37/150
    (/
      (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
      (* 3 (- 6 2) (- 2 7)))))

(define (sum-of-squares-of-largest-two-of-three x y z)
  (define (sum-of-squares xs)
    (reduce-left + 0 (map * xs xs))
  )
  (define (largest-two-of-three x y z)
    (cond
      ((< x y z) (list y z))
      ((< y z x) (list z x))
      ((< z x y) (list x y))
    )
  )
  (sum-of-squares (largest-two-of-three x y z))
)
(assert "Exercise 1.3"
  (=
    41
    (sum-of-squares-of-largest-two-of-three 3 4 5)))

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b)
)
(assert "Exercise 1.4"
  (=
    (a-plus-abs-b a b)
    7))

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 (y)))
(assert "Exercise 1.5"
  (=
    (test 0 p)
    0
    )
)

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause) (else else-clause)))
(define x 0)

(assert "Exercise 1.6"
  (and
    (= (new-if (= 2 3) 0 5) 5)
    (= (new-if (= 1 1) 0 5) 0)
    (= (new-if (= 1 1) x (set! x 1)) 1)
  )
)

(define (good-enough? guess x)
  (< (abs (- 1 (/ (square guess) x))) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (acceptable-square? x tolerance)
  (< (abs (- 1 (/ (square (sqrt x)) x))) tolerance))

(assert "Exercise 1.7"
  (let ((tolerance 0.001))
    (and
      (acceptable-square? 0.00000000001 tolerance)
      (acceptable-square? 1000000000000 tolerance))))

(define (cbrt-improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cbrt-good-enough? guess x)
  (< (abs (- 1 (/ (expt guess 3) x))) 0.001))

(define (cbrt-iter guess x)
  (if (cbrt-good-enough? guess x)
    guess
    (cbrt-iter (cbrt-improve guess x) x)))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(define (acceptable-cube? x tolerance)
  (< (abs (- 1 (/ (expt (cbrt x) 3) x))) tolerance))

(assert "Exercise 1.7"
  (let ((tolerance 0.001))
    (and
      (acceptable-cube? 27 tolerance)
      (acceptable-cube? 0.00000000001 tolerance)
      (acceptable-cube? 1000000000000 tolerance))))
