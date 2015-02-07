#lang racket

(provide (all-defined-out))

;;--------------------------------------
;; constants
(define nouns-filename "nounlist.txt")
(define nouns-file (open-input-file nouns-filename))

;;--------------------------------------
;; various game backend functions

(define (get-number-nouns)
  (get-number-nouns-helper (open-input-file nouns-filename) 0))
(define (get-number-nouns-helper file line-count)
  (let ([line (read-line file)])
    (if (eof-object? line)
        line-count
        (get-number-nouns-helper file (+ line-count 1)))))

(define (get-noun-at-line-number line-num)
  (get-noun-at-line-number-helper (open-input-file nouns-filename) line-num 0))
(define (get-noun-at-line-number-helper file line-num curr-line-num-read)
  (let ([read-noun (read-line file)])
    (if (eq? line-num curr-line-num-read)
        read-noun
        (get-noun-at-line-number-helper file line-num (+ 1 curr-line-num-read)))))

(define (get-new-noun) 
  (let ([noun-num-choice (random (get-number-nouns))])
    (get-noun-at-line-number noun-num-choice)))

;;-----------------------------------------
;; User Interface specific functions

(define (print-home-screen)
  (printf "--------------------------------------------") (newline)
  (printf "--         Welcome to Hangman             --") (newline)
  (printf "--------------------------------------------") (newline))

(define (print-word-slots num-slots)
  (newline)
  (printf (get-word-slots num-slots))
  (newline))

(define (get-word-slots num-slots)
  (letrec ([print-a-slot 
                    (lambda (num-slots-left accum-list)
                      (if (eq? 0 num-slots-left)
                          accum-list
                          (print-a-slot (- num-slots-left 1) (string-append accum-list "_ "))))])
            (print-a-slot num-slots "")))
;;------------------------------------------
(define (hangman)
  (print-home-screen)
  (print-word-slots (string-length (get-new-noun))))

(hangman)
