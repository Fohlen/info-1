;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt03-A3-fuel) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Blatt02-A3-fuel

; Berechnet Literverbauch auf 100km
; <float> liters-per-hundred-kilometer(<float>, <float>)
(define liter-per-hundred-kilometer
  (lambda (benzin kilometer)
    (* (/ kilometer benzin) 100)))

; Berechnet Meilen pro Gallone
; <float> miles-per-gallon(<float>, <float>)
(define miles-per-gallon
  (lambda (miles gallon)
    (/ miles gallon)))

; <float> KILOMETERS_PER_MILE
(define KILOMETERS-PER-MILE 1.61)

; Rechnet Kilometer in Meilen um
; <float> kilometer-to-miles(<float>)
(define kilometer-to-miles
  (lambda (kilometer)
    (* kilometer KILOMETERS-PER-MILE)))

; Rechnet Meilen in Kilometer um
; <float> miles-to-kilometer(<float>)
(define miles-to-kilometer
  (lambda (miles)
    (/ miles KILOMETERS-PER-MILE)))

; <float> LITERS-PER-GALLON
(define LITERS-PER-GALLON 3,79)

; Rechnet Liter in Gallonen um
; <float> liters-to-gallon(<float>)
(define liters-to-gallon
  (lambda (liters)
    (/ liters LITERS-PER-GALLON)))

; Rechnet Gallonen in Liter um
; <float> gallon-to-liters
(define gallon-to-liters
  (lambda (gallons)
    (* gallons LITERS-PER-GALLON)))

; Liter pro 100/kilometer -> Meilen / Gallone
; <float> l-100-to-gallone(<float>)
(define l-100-to-gallone
  (lambda (consumption)
    (* LITERS-TO-GALLON (liters-to-gallon (- 1 (/ consumption 100))))))

; Meilen / Gallone -> Liter pro 100kilometer
; <float> gallone-to-l-100(<float>)
(define gallone-to-l-100
  (lambda (consumption)
    (/ LITERS-TO-GALLON (gallon-to-liters (- 1 (* consumption KILOMETERS-PER-MILE))))))