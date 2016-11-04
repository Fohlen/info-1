;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt03-A3-fuel) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Blatt02-A3-fuel

; Berechnet Literverbauch auf 100km
(: liters-per-hundred-kilometer (real real -> real))
(check-expect (liters-per-hundred-kilometer 5 100) 5)
(define liters-per-hundred-kilometer
  (lambda (benzin kilometer)
    (* (/ benzin kilometer) 100)))

; Berechnet Meilen pro Gallone
; <float> miles-per-gallon(<float>, <float>)
(: miles-per-gallon (real real -> real))
(check-expect (miles-per-gallon 100 10) 10)
(define miles-per-gallon
  (lambda (miles gallon)
    (/ miles gallon)))

; Konstante für die Umrechung von Kilometer in Meile. 
(define kilometers-per-mile 1.61)

; Rechnet Kilometer in Meilen um
(: kilometers->miles (real -> real))
(check-within (kilometers->miles 1 ) 1.61 0.001)
(define kilometers->miles
  (lambda (kilometer)
    (* kilometer kilometers-per-mile)))

; Rechnet Meilen in Kilometer um)
(: miles->kilometers (real -> real))
(check-within (miles->kilometers 1.61 ) 1 0.001)
(define miles->kilometers
  (lambda (miles)
    (/ miles kilometers-per-mile)))

;  Konstante für die Umrechung von Liter in Gallone.
(define liters-per-gallon 3.79)

; Rechnet Liter in Gallonen um.
(: liters->gallons (real -> real))
(check-within (liters->gallons 3.79) 1 0.001) 
(define liters->gallons
  (lambda (liters)
    (/ liters liters-per-gallon)))

; Rechnet Gallonen in Liter um.
(: gallons->liters (real -> real))
(check-within (gallons->liters 1) 3.79 0.001)
(define gallons->liters
  (lambda(gallons)
    (* gallons liters-per-gallon)))

; Rechnet den Verbrauch, in Liter pro 100 Kilometer, in die Reichweite mit der Einheit Meilen pro Gallone um.
(: l/100km->mi/gal (real -> real))
(check-within (l/100km->mi/gal 5) 122.038 0.001)
(define l/100km->mi/gal
  (lambda (consumption-in-liters)
    (kilometers->miles(/ 1 (liters->gallons(/ consumption-in-liters 100 ))))))

; Rechnet die Reichweite, in Meilen pro Gallone, in den Verbrauch mit der Einheit Liter pro 100 Kilometer  um.
(: mi/gal->l/100km (real -> real))
(check-within (mi/gal->l/100km 122.038) 5 0.001)
(define mi/gal->l/100km
  (lambda (range-in-miles)
    (* (gallons->liters(/ 1 (miles->kilometers range-in-miles))) 100)))
