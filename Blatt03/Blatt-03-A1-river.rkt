;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt-03-A1-river) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm")))))
; Konstanten
(define Wasserfall-Strecke 200)
(define Ufer-Strecke 400)
(define v_Schiff 5)
(define v_Fluss 1.5)

; Prüft ob der Kapitän es ans andere Ufer schafft bevor er den Wasserfall hinunter stürtzt.
(: plunges? (real real -> boolean))
(check-expect (plunges? 5 1.5) #t )
(define plunges?
  (lambda(v_Schiff v_Fluss)
    (<(drift v_Schiff v_Fluss Ufer-Strecke)Wasserfall-Strecke)))

; Berechnet den Drift des Schiffes
(: drift (real real real -> real))
(check-within (drift 5 1.5 400) 120 0.001)
(define drift
  (lambda(v_Schiff v_Fluss s_Senkrecht)
    (/(* s_Senkrecht v_Fluss) v_Schiff)))

; Berechnet die Bilder für die Simulation
(: crossing (natural -> image))
(define crossing)

; Verschiebt das Schiff gemäß seines Drifts
(: boat-at (natural -> image))

