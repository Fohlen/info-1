;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-vanilla-reader.ss" "deinprogramm")((modname luhn) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Berechnet die Summe einer Liste von Zahlen
(: sum ((list-of number) -> number))
(check-expect (sum (list 1 2 3 4 5)) 15)
(check-expect (sum (list 7 7 7)) 21)
(check-expect (sum (list 100 1 99)) 200)

(define sum
  (lambda (l)
    (if (not (empty? l))
        (+ (first l) (sum (rest l))) 0)))


; Zerlegt eine Digit in eine Liste seiner Ziffern
(: digits (natural -> (list-of natural)))
(check-expect (digits 1024) (list 4 2 0 1))
(check-expect (digits 0) (list 0))
(check-expect (digits 512) (list 2 1 5))

(define digits
  (lambda (d)
    (if (< d 10)
        (make-pair d empty)
        (make-pair (remainder d 10) (digits (quotient d 10))))))

; Verdoppelt jede 2te Zahlt in einer Liste von Zahlen
(: double-every-other-number ((list-of number) -> (list-of number)))
(check-expect (double-every-other-number empty) empty)
(check-expect (double-every-other-number (list 1 2 3 4 5)) (list 1 4 3 8 5))
(check-expect (double-every-other-number (list 5 6)) (list 5 12))
(check-expect (double-every-other-number (list 1)) (list 1))
(check-expect (double-every-other-number empty) empty)
(define double-every-other-number
  (lambda (l)
    (cond
      [(empty? l) empty]
      [(pair? l)
       (let ([r (rest l)] [f (first l)])
         (if (empty? r)
             (make-pair f empty)
             (make-pair f (make-pair (* 2 (first r)) (double-every-other-number (rest r))))))])))

; Zerlegt eine Liste von Digits in in Listen von Ziffern
(: map-digits ((list-of natural) -> (list-of (list-of natural))))
(check-expect (map-digits (list 2 13 9)) (list (list 2) (list 3 1) (list 9)))

(define map-digits
  (lambda (l)
    (cond
      [(empty? l) empty]
      [(pair? l) (make-pair (digits (first l)) (map-digits (rest l)))])))

; Aktzeptiert eine Liste von Listen und hängt diese aneinander an
(: concat ((list-of (list-of natural)) -> (list-of natural)))
(check-expect (concat (list (list 1 2) (list 3 4) (list 5))) (list 1 2 3 4 5))

(define concat
  (lambda (l)
    (cond
      [(empty? l) empty]
      [(pair? l) (append (first l) (concat (rest l)))])))

; FÜhrt den Luhn-Check durch
(: luhn-check (natural -> boolean))
(check-expect (luhn-check 5678) #t)
(check-expect (luhn-check 6789) #f)

(define luhn-check
  (lambda (l)
    (= 0 (modulo (sum (concat (map-digits (double-every-other-number (digits l))))) 10))))