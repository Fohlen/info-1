;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt04-A5-soccer) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm") (lib "universe.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm") (lib "universe.rkt" "teachpack" "deinprogramm")))))
; Gibt für eine gegebene Spielernummer die zugehörige Spielerpostion(Mittelfer, Sturm etc.) zurück.
(: player-position (natural -> (one-of "Torwart" "Abwehr" "Mittelfeld" "Sturm" "Ersatz" "Ungültig")))
(check-expect(player-position 0) "Ungültig")
(check-expect(player-position 1) "Torwart")
(check-expect(player-position 2) "Abwehr")
(check-expect(player-position 6) "Mittelfeld")
(check-expect(player-position 9) "Sturm")
(check-expect(player-position 55) "Ersatz")
(check-expect(player-position 100) "Ungültig")
(define player-position
  (lambda (number)
   (cond ((= number 1) "Torwart")
         ((and (>= number 2) (<= number 5)) "Abwehr")
         ((or (and (>= number 6) (<= number 8)) (= number 10))   "Mittelfeld")
         ((or (= number 9) (= number 11)) "Sturm")
         ((and (>= number 13) (<= number 99)) "Ersatz")
         (else "Ungültig"))))