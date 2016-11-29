;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-vanilla-reader.ss" "deinprogramm")((modname A1-let) (read-case-sensitive #f) (teachpacks ((lib "geocoder.rkt" "installed-teachpacks"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "geocoder.rkt" "installed-teachpacks")))))
; Ohne let
(define f
  (lambda (x)
    (lambda (r)
      (i r (h r)))(r (g x))))

; Dies ist gültig, weil let nur eine vereinfachte Schreibweise der Lambda-Abstraktion ist.
	
;  Mit let
(define f
  (lambda (x)
    (let ((r (g x)))
      (i r
         (h r)))))	