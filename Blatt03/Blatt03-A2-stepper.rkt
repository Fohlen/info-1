;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt03-A2-stepper) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm")))))
; Blatt03-A2-stepper

; Ausdruck #1
((lambda (a) a)
 (+ ((lambda (a) (+ a 2)) 3) 2))

; Step-by-step
; applyprim(f) 3 + 2
; applyprim(f) 5 + 2
; => 7
; applyλ(a) (vorherige Expression wird nicht berührt)
; => 7

; Ausdruck 2
(define pi 3.141)
(* 2 pi)

; evalid(PI)
; applyprim(f) 2 * PI
; => 6.282

; Ausdruck 3
((lambda (pi) (* 2 pi)) pi)

; evalid(PI)
; apply(λ)
; applyprim(f) 2 * pi (das äußere PI wird nicht mehr evaluiert!)
; => 6.282

; Ausdruck 4
(define quadrat
  (lambda (n)
    (* n n)))
 
(quadrat (+ 4 2))
; apply(λ) (Quadrant, n)
; applyprim(f) 4 + 2
; => 6
; applyprim(f) 6 ^ 2
; => 36

; Ausdruck 5
((lambda (x) x) (lambda (x) x))
; Reduktion -> (lambda (x) x)
; apply(λ) x
; => x