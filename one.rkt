#lang racket
(define one_ (λ (x) 1))

;In each example, the return value is 1
(one_ 9)
(one_ '(C . 24))
