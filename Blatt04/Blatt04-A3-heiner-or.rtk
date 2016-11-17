;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt04-A3-heiner-or) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm") (lib "universe.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm") (lib "universe.rkt" "teachpack" "deinprogramm")))))
; Reduktionsregeln:
; Bei der Spezialform or wird der Reihenfolge der Ausdrücke nach reduziert, bis ein wahrer Wert erhalten wird. Falls ein wahrer Wert erhalten wird, werden die folgenden Ausdrücke nicht mehr reduziert.
; Für den Ablauf siehe Blatt.
; Bei heiner-or wird hingegegen jeder Ausdruck ausgewertet, auch schon ein wahrer Wert erhalten wurde.

; Sub-Modell:
; heiner-or: (evalvar evallit evallit applyprim)->(evalvar evallit evallit applyprim)->evalabs->applyλ
; or: (evalvar evallit evallit applyprim)->evalor->(evalvar evallit evallit applyprim)->evalor

(: heiner-or (boolean boolean -> boolean))
(define heiner-or
   (lambda (test-1 test-2)
      (if test-1
          #t
          test-2)))

; Läuft, obwohl das zweite Argument von "or" gar nicht ausgewertet werden kann.
(or (= 10 10) (+ 2 5) )

; Läuft nicht, da beide Ausdrücke ausgewertet werden müssten von denen einer die Signatur verletzt.
(heiner-or (= 10 10) (+ 2 5))
