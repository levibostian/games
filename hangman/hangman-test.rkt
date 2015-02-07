#lang racket

;; TESTS

(require "hangman.rkt")
(require rackunit)

;;--------------------------------------
;; various game backend functions
(check-equal? (get-number-nouns) 2328)
(check-equal? (get-noun-at-line-number 1) "abyssinian")

;;------------------------------------
;; User interface specific functions
(check-equal? (string-length (get-word-slots 3)) 6)
