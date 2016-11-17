;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt04-A2-compact) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm")))))
(: less-zero? (number -> boolean))
(check-expect (less-zero? -1) #t)
(define less-zero?
  (lambda (x)
    (if (< x 0) #t #f)))

(: f (number -> boolean))
(check-expect (f 11) #t)
(define f
  (lambda (f)
    (cond
      ((>= f 11) #t)
      ((< f 11) #f))))

(: g (boolean boolean -> boolean))
(check-expect (g #f #t) #f)
(check-expect (g #f #f) #t)
(define g
  (lambda (a b)
    (not b)))

(: greater-equal-zero? (number -> boolean))
(check-expect (greater-equal-zero? 10) #t)
(define greater-equal-zero?
  (lambda (x)
    (cond
      ((>= x 0) #t)
      (else #f))))
