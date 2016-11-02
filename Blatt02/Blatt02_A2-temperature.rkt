;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt02_A2-temperature) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Blatt02-A2-temperature
; Rechnet celsius zu fahrenheit um
; <float> celsius_zu_fahrenheit(<float>)
(define celsius_zu_fahrenheit
  (lambda (C)
    (+ (* C 9/5) 32)))

; Rechnet fahrenheit zu celsius um
; <float> fahrenheit_zu_celsius(<float>)
(define fahrenheit_zu_celsius
  (lambda (F)
    (/ (- F 32) 9/5)))

; Teste fahrenheit -> celsius und celsius -> fahrenheit für C = 1
; Mit einer Schleife könnte dies für a(n) Fälle getestet werden
(define C 1)
(define F (celsius_zu_fahrenheit C))
(= C (fahrenheit_zu_celsius F))