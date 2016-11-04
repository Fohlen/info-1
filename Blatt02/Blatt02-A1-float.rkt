;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt02-A1-float) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Blatt02-A1-float

; Vergleicht ob a und b maximal um den Wert eps verschieden sind
(: equal-eps (real real real -> boolean))
(check-expect (equal-eps 5 2 0) #f)
(check-expect (equal-eps 2/3 (- 1 1/3) 0) #t)
(check-expect (equal-eps (sqrt 2) 0.7072 0) #f)
(define equal-eps
  (lambda (a b eps)
    (<= (abs (- a b)) (abs eps))))

