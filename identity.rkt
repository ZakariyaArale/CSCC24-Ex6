#lang racket
(define identity_ (λ (x) x))

;In each example, the return value is the inputted value
(identity_ 9)
(identity_ '(C . 24))
