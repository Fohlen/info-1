;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-vanilla-reader.ss" "deinprogramm")((modname A3-insertion-sort) (read-case-sensitive #f) (teachpacks ((lib "image2.ss" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.ss" "teachpack" "deinprogramm")))))
; Listige Liste
(define liste1
  (make-pair 3
             (make-pair 12 
                        (make-pair 45 
                                   (make-pair 113 empty)))))

; Lustige Liste
(define liste2
  (make-pair 113
             (make-pair 12 
                        (make-pair 45 
                                   (make-pair 3 empty)))))

; Sortiert gegebene Zahl ein
(: insert-sorted (real (list-of real) -> (list-of real)))
(check-expect (insert-sorted 23 empty) (make-pair 23 empty))
(check-expect (insert-sorted 23 liste1) (make-pair 3
                                                   (make-pair 12 
                                                              (make-pair 23
                                                                         (make-pair 45 
                                                                                    (make-pair 113 empty))))))
(define insert-sorted
  (lambda (num list)
        (cond ((empty? list) (make-pair num empty))
              ((pair? list) (if (<= num (first list))
                            (make-pair num list)
                            (make-pair (first list) (insert-sorted num (rest list))))))))


; Sortiert eine gegebene Liste.
(: sort-list ((list-of real) -> (list-of real)))
(check-error (sort-list empty) "Leere Liste")
(check-expect (sort-list liste2) liste1)
(define sort-list
  (lambda (list)
    (cond ((empty? list) (violation "Leere Liste"))
          ((pair? list) (if (= (length list) 1)
                            list
                            (insert-sorted (first list) (sort-list (rest list))))))))

    

