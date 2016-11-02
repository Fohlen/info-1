;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt02-A1-float) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Blatt02-A1-float
; Vergleicht ob a und b maximal um den Wert eps gleich sind
; <bool> equal_eps(<float> a, <float> b, <float> eps)
(define equal-eps
  (lambda (a b eps)
    (<= (abs (- a b)) (abs eps))))
    
 
; Zu testen:
; 2/3 == 1 - 1/3
(equal-eps 2/3 (- 1 1/3) 0)
