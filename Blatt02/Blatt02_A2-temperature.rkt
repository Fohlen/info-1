;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt02_A2-temperature) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Blatt02-A2-temperature

; Rechnet Celsius in Fahrenheit um
(: celsius->fahrenheit (real -> real))
(check-expect (celsius->fahrenheit 0) 32)
(define celsius->fahrenheit
  (lambda (C)
    (+ (* C 9/5) 32)))

; Rechnet Fahrenheit in Celsius um.
(: fahrenheit->celsius (real -> real))
(check-expect (fahrenheit->celsius 0) (* -32 5/9))
(define fahrenheit->celsius
  (lambda (F)
    (* (- F 32) 5/9)))
