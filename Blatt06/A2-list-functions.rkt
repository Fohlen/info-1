;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname A2-list-functions) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #t #t none explicit #f ())))
;Beispielliste 1
(: liste1 (list-of natural))
(define liste1
  (make-pair 1 
             (make-pair 2 
                        (make-pair 3 
                                   (make-pair 4 
                                              empty)))))  

; Beispielliste 2
(: liste2 (list-of natural))
(define liste2
  (make-pair 5 
             (make-pair 2 
                        (make-pair 3 
                                   (make-pair 4 
                                              empty)))))  

;Beispielliste 3
(: liste3 (list-of natural))
(define liste3
  (make-pair 5 
             (make-pair 5 
                        (make-pair 5 
                                   (make-pair 5 
                                              empty)))))  

; Ein polymorphes Paar (pair) besteht aus
; - erster Komponente (first)
; - zweiter Komponente (rest)
; wobei die Komponenten jeweils beliebige Werte sind: 
(define-record-procedures-parametric pair pair-of
  make-pair
  pair?
  (first   
   rest))

; Eine Liste von Werten der Signatur <t> (list-of <t>) ist entweder
; - leer (Signatur empty-list) oder
; - ein Paar (Signatur pair-of) aus
;   - einem Listenkopf der Signatur <t> und  
;   - einer Restliste der Signatur (list-of <t>)
(define list-of
  (lambda (t)
    (signature (mixed empty-list
                      (pair-of t (list-of t))))))

; Gibt die Länge einer Liste aus.
(define length
  (lambda (xs)
    (cond ((empty? xs) 0)
          ((pair? xs)  (+ 1 (length (rest xs)))))))

; Gibt das letzte Element einer Liste aus.
(: last ((list-of %a) -> %a))
(check-expect (last liste1) 4)
(check-error (last empty) "Liste ist leer")
(define last
  (lambda (list)
    (cond [(empty? list) (violation "Liste ist leer")]
          [(pair? list) (if (= (length list) 1)
                           (first list)
                           (last (rest list)))])))

; Prüft, ob ein Element Teil der Liste ist
(: elem? (number (list-of number) -> boolean))
(check-expect (elem? 4 liste1) #t)
(check-expect (elem? 7 liste1) #f)
(define elem?
  (lambda (element list)
    (cond ((empty? list) #f)
          ((pair? list) (if (= (first list) element)
                             #t
                             (elem? element (rest list)))))))

; Gibt die größte Zahl in der Liste zurück
(: max-list ((list-of natural) -> natural))
(check-expect (max-list liste1) 4)
(check-expect (max-list liste2) 5)
(check-error (max-list empty) "Liste ist leer")
(define max-list
  (lambda (list)
    (cond ((empty? list) (violation "Liste ist leer"))
          ((pair? list) (if (= (length list) 1)
                            (first list)
                            (if (<= (first list) (first (rest list)))
                                (max-list (rest list))
                                (max-list (make-pair (first list) (rest (rest list))))))))))  

; Löscht das letzte Element einer Liste. Hier nochmal drüber schauen.
(: init ((list-of %a) -> (list-of %a)))
(check-expect (init liste1) (reverse (rest (reverse liste1))))
(check-error (init empty) "Liste ist leer")
(define init
  (lambda (list)
    (cond ((empty? list) (violation "Liste ist leer"))
          ((pair? list) ((reverse(rest(reverse list))))))))

; Prüft, ob alle Elemente einer Liste gleich sind
(: all-equal? ((list-of natural) -> boolean))
(check-expect (all-equal? liste3) #t)
(check-expect (all-equal? liste2) #f)
(check-expect (all-equal? empty) #t)
(define all-equal?
  (lambda (list)
    (cond ((empty? list) #t)
          ((pair? list) (if (= (length list) 1)
                            #t
                            (if (= (first list) (first (rest list)))
                                (all-equal? (rest list))
                                #f))))))      

; Erstellt eine Liste, in der n-mal ein beliebiger Wert v steht
(: replicate (natural %a -> (list-of %a)))
(check-expect (replicate 4 "f") (make-pair "f" 
                                            (make-pair "f" 
                                                       (make-pair "f" 
                                                                  (make-pair "f" 
                                                                             empty)))))
(define replicate
  (lambda (anz val)
    (if (<= anz 1)
        (make-pair val empty)
        (make-pair val (replicate (- anz 1) val)))))