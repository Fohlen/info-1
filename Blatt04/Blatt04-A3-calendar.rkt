;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname Blatt04-A3-calendar) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm")))))
; Ein Kalenderdatum (calendardate) besteht aus
; - Tag (number)
; - Monat (number)
; - Jahr (number)

(: make-calendardate (tag monat jahr -> calendardate))
(: calendardate-tag (calendardate -> number))
(: calendardate-monat (calendardate -> numer))
(: calendardate-jahr (calendardate -> number))
(define-record-procedures calendardate
  make-calendardate
  calendardate?
  (calendardate-tag
   calendardate-monat
   calendardate-jahr))

; Checkt ein Kalenderdatum auf Gültigkeit
(: calendar-date-ok? (calendar-date -> boolean))
(check-expect (calendardate-date-ok? (calendardate 10 01 1997)) #t)
(define calendar-date-ok?
  (lambda (rc)
    (if (and (within? (calendardate-tag rc) 1 31) (within? (calendardate-monat rc) 1 12)))))

; Weil es auch Jahre v.Chr gibt ist es irrelevant ob +/- und der typecheck lässt nur ganzzahlige Werte zu
