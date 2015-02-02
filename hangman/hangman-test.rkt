#lang racket

;; TESTS

(require "hangman.rkt")
(require rackunit)

(check-equal? (get-number-nouns) 2328)
(check-equal? (get-noun-at-line-number 1) "abyssinian")
