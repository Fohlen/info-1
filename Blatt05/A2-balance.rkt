;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname A2-balance) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm")))))
(require racket/math)
; Wird benötigt für PI
(: shape ((mixed c_circle c_rectangle c_triangle) -> shape ))
(define shape
  (lambda (shape)
          shape))
 
    
; Prefix everything with c_ for custom
; Definiert einen Kreis (circle)
; - radius (real)
; - color (string)
(: make-c_circle (real string -> c_circle))
(: c_circle-radius (c_circle -> real))
(: c_circle-color (c_circle -> string))
(define-record-procedures c_circle
  make-c_circle
  c_circle?
  (c_circle-radius
   c_circle-color))

; Definiert ein Rechteck (rectangle)
; - length (real)
; - height (real)
; - color (string)
(: make-c_rectangle (real real string -> c_rectangle))
(: c_rectangle-length (c_rectangle -> real))
(: c_rectangle-height (c_rectangle -> real))
(: c_rectangle-color (c_rectangle -> string))
(define-record-procedures c_rectangle
  make-c_rectangle
  c_rectangle?
  (c_rectangle-height
   c_rectangle-length
   c_rectangle-color))

; Definiert ein Dreieck (triangle)
; - length (real)
(: make-c_triangle (real string -> c_triangle))
(: c_triangle-length (c_triangle -> real))
(: c_triangle-color (c_triangle -> string))
(define-record-procedures c_triangle
  make-c_triangle
  c_triangle?
  (c_triangle-length
   c_triangle-color))


(: shape-area (shape -> real))
(define shape-area
  (lambda (s)
    (cond
      [(c_circle? s) (* pi (expt (c_circle-radius) 2))]
      [(c_rectangle? s) (* (c_rectangle-height s) (c_rectangle-length s))]
      [(c_triangle? s) (* (/ (expt (c_triangle-length s) 2) 4) (sqrt 3))])))

; Berechnet die Länge einer Waage
(: scale-length (image image real -> real))
(check-expect (scale-length (circle 1 "solid" "red") (circle 2 "solid" "red") 1) 7)
(check-expect (scale-length (rectangle 2 1 "solid" "red") (circle 2 "solid" "red") 1) 7)
(define scale-length
  (lambda (img1 img2 w2)
    (+(+(image-width img1) (image-width img2)) w2)))
 
; Zeichnet aus einer shape ein Bild(Kreis, Dreieck, Rechteck).
(: draw-shape (shape -> image))
(define draw-shape
  (lambda(s)
    (cond
      [(c_circle? s) (circle (c_circle-radius s) "solid" (c_circle-color s))]
      [(c_rectangle? s) (rectangle (c_rectangle-length s) (c_rectangle-height s) "solid" (c_rectangle-color s))]
      [(c_triangle? s) (triangle (c_triangle-length s)  "solid" (c_triangle-color s))])))

; Zeichnet für zwei shapes eine Waage.
(: draw-scale (shape shape -> image))
(define draw-scale
  (lambda (s1 s2)
    (rotate (shape-area s1) (shape-area s2)  (rotation-angle  (above(beside/align "bottom"  (draw-shape s1) (empty-scene 40 0) (draw-shape s2)) ( scale-length  (draw-shape s1) (draw-shape s2)) ( line 0 "black"))))))
(draw-scale (circle 40 "solid" "red") (circle 40 "solid" "blue"))

; Berechnet den Rotationswinkel für zwei Flächen.
(: rotation-angle (real real -> real))
(check-expect (rotation-angle 1 1) 0)
(check-expect (rotation-angle 2 1) 45)
(check-expect (rotation-angle 1 2) -45)
(define rotation-angle
  (lambda (A1 A2)
    (* 90 (if(> A1 A2) (- 1 (/ A2  A1)) (+ -1 (/ A1  A2))))))