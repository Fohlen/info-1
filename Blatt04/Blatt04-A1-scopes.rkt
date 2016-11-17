;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt04-A1-scopes) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm")))))
(define x 1) ; 
(define y 5)


; Bei einer lexikalischen Bindung gibt es mehrere Gültigkeitsebenen für eine Variable
; So würden die Ergebnisse deutlich anders ausfallen wenn eine Übergabe der Parameter in stattfindet statt einer Reduktion
; Dann wird x, y zunächst im lokalen Bereich der Funktion aufgelöst, bevor es global aufgelöst wird

; evalid y = 5
; lexikalische Bindung x = y für (* 2 x)
; applyprim(f) 2 * 5
; evalid x(global) = 1
; applyprim(f) x + x(global)
; applyλ => 11
((lambda (x y)
   (+ (* 2 x) y))
 y x)


; evalid x = 1
; Reduktion
; evalid x = 1
; applyprim 1 + x => 2
; evalid y = 5
; applyprim 2 + y => 7
; ; applyλ => 7
((lambda (a b)
   (+ (* 2 x) y))
 y x)
