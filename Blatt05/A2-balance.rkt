;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname A2-balance) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm")))))
(require racket/math)
; Wird benötigt für PI

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

; Definiert eine Oberfläche (shape)
; - element (mixed)
(: make-shape (mixed -> shape))
(: shape-element (shape -> mixed))
(define-record-procedures shape
  make-shape
  shape?
  (shape-element))

; Berechnet den Flächeninhalt eines Shapes
(: shape-area (shape -> real))
(define shape-area
  (lambda (s)
    (cond
      [(c_circle? s) (* pi (expt (c_circle-radius) 2))]
      [(c_rectangle? s) (* (c_rectangle-height s) (c_rectangle-length s))]
      [(c_triangle? s) (* (/ (expt (c_triangle-length s) 2) 4) (sqrt 3))])))