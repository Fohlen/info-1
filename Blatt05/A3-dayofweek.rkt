;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname A3) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm")))))
( define Mo " Montag ")
( define Di " Dienstag ")
( define Mi " Mittwoch ")
( define Do " Donnerstag ")
( define Fr " Freitag ")
( define Sa " Samstag ")
( define So " Sonntag ")
(: Wochentag? (string -> boolean))
(define Wochentag?
  (lambda(Eingabe)
    (if (= Eingabe (or Mo (or Di (or Mi (or Do (or Fr (or Sa (or So)))))))) #t #f)))
; Ermittelt die Nummer eines Wochentages innerhalb einer Woche .
; Die Nummerierung beginnt mit 0 und nimmt Montag als ersten Tag der Woche an.
(: wochentag-index ((predicate Wochentag?) ->  natural))
( define wochentag-index (lambda(tag) (cond ((string =? tag Mo) 0)
                                            ((string =? tag Di) 1)
                                            ((string =? tag Mi) 2)
                                            ((string =? tag Do) 3)
                                            ((string =? tag Fr) 4)
                                            ((string =? tag Sa) 5)
                                            ((string =? tag So) 6)
)))