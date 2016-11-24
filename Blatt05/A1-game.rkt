;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname A1-game) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm")))))
; Definiert eine Position
; - x (number)
; - y (number)
(: make-position (number number -> position))
(: position-x (position -> number))
(: position-y (position -> number))
(define-record-procedures position
  make-position
  position?
  (position-x
   position-y))

; Definiert einen Character
; - name (string)
; - health (number)
; - position (position)
(: make-character (string number position -> character))
(: character-name (character -> string))
(: character-health (character -> number))
(: character-position (character -> position))
(define-record-procedures character
  make-character
  character?
  (character-name
   character-health
   character-position))

; Definiert eine Bombe (bomb)
; - radius (number)
; - damage (number)
(: make-bomb (number number -> bomb))
(: bomb-radius (bomb -> number))
(: bomb-damage (bomb -> number))
(define-record-procedures bomb
  make-bomb
  bomb?
  (bomb-radius
   bomb-damage))

; Definiert eine Attacke (attack)
; - position (position)
; - bomb (bomb)
(: make-attack (position bomb -> attack))
(: attack-position (attack -> position))
(: attack-bomb (attack -> bomb))
(define-record-procedures attack
  make-attack
  attack?
  (attack-position
   attack-bomb))

; Berechnet die euklidische Distanz zweier Punkte
(: euclidean-distance (position position -> real))
; Definiere einen Testpunkt
(define nullposition (make-position 0 0))
(define position1 (make-position 2 5))
(check-expect (euclidean-distance nullposition nullposition) 0)
(check-within (euclidean-distance position1 nullposition) (sqrt 29) 0.001)
(define euclidean-distance
  (lambda (x y)
    (sqrt (+ (expt (- (position-x x) (position-x y)) 2) (expt (- (position-y x) (position-y y)) 2)))))


; Berechnet den Schaden den der Character durch eine Attacke erhält
; - distance (real)
; - attack (attack)
(define attack1 (make-attack  nullposition (make-bomb 50 50)))
(define attack2 (make-attack  (make-position 1 1) (make-bomb 4 50)))
(define attack3 (make-attack  (make-position 2 2) (make-bomb (sqrt 8) 50)))
(: character->damage (position attack -> number))
(check-expect (character->damage nullposition attack1) 50)
(check-within (character->damage nullposition attack2) (round (* (- 1(/ (sqrt 2) 4)) 50)) 0.001)
(check-within (character->damage nullposition attack3) 0 0.001)
(define character->damage
  (lambda (d a)
    (round (* (- 1 (/ (euclidean-distance d (attack-position a)) (bomb-radius (attack-bomb a)))) (bomb-damage (attack-bomb a))))))

; Berechnet den Schaden einer Attacke für einen Character
(: drop-bomb (character attack -> character))

; Couldn't this be done with an if? Syntax is strange....
(define drop-bomb
  (lambda (c a)
    (if (<(euclidean-distance (attack-position a) (character-position c)) (bomb-radius (attack-bomb a)))
       (make-character (character-name c) (- (character-health c) (character->damage (character-position c) a)) (character-position c)) c)))

(define character1 (make-character "Gorsten Trust" 100 nullposition))
(check-within (drop-bomb character1 attack1) (make-character (character-name character1) 50 (character-position character1)) 0.001)