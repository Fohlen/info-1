;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-vanilla-reader.ss" "deinprogramm")((modname split-weave) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Definiert einen Tuple: einen Datentyp der 2 beliebige Datentypen halten kann
(: make-tuple (%a %a -> (tuple-of %a %a)))
(: tuple? (any -> boolean))
(: tuple-first ((tuple-of %a %a) -> %a))
(: tuple-second ((tuple-of %a %a) -> %a))
(define-record-procedures-parametric tuple tuple-of
  make-tuple
  tuple?
  (tuple-first tuple-second))

; Verteilt die Elemente einer Liste auf ein Tupel von zwei Listen
(: split-list ((list-of %a) -> (tuple-of (list-of %a) (list-of %a))))
; Testfälle
(check-expect (split-list (list 1 2 3 4 5)) (make-tuple (list 1 3 5) (list 2 4)))

(define split-list
  (lambda (l)
    (cond
      [(empty? l) (make-tuple empty empty)]
      [(pair? l)
       (let ([f (first l)] [r (rest l)])
         (cond
           [(empty? r) (make-tuple (make-pair f empty) empty)]
           [(pair? r)
            (let ([l (split-list (rest r))])
              (make-tuple (make-pair f (tuple-first l)) (make-pair (first r) (tuple-second l))))]))])))

; "Weaved" ein paar von Listen zu einer einzelnen Liste, wobei es dabei abwechselnd vorgeht
(: weave-lists ((tuple-of (list-of %a) (list-of %a)) -> (list-of %a)))
(check-expect (weave-lists (make-tuple (list 1 3 5 6) (list 2 4))) (list 1 2 3 4 5 6))

(define weave-lists
  (lambda (t)
    (let ([f (tuple-first t)] [s (tuple-second t)])
      (cond
        [(empty? f) s]
        [(empty? s) f]
        [(and (pair? s) (pair? f))
         (make-pair (first f) (weave-lists (make-pair (first s) (append (rest f) (rest s)))))]))))


; Überprüft die Äquivalenz
(check-property (for-all ((x (list-of natural))) (expect (weave-lists (split-list x)) x)))