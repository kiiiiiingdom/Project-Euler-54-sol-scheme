#lang racket
(define q2-data '(
"8C TS KC 9H 4S 7D 2S 5D 3S AC"
"5C AD 5D AC 9C TC QC JC KC AC"
))
(define (player1 i)
(substring (list-ref q2-data i) 0 14)
)

(define (player2 i)
(substring (list-ref q2-data i) 15 29)
)

(define (loadin i)
(list-ref q2-data i)
)

(define (flush! player)
  (let((a (string-ref player 1))
    (b (string-ref player 4))
    (c (string-ref player 7))
    (d (string-ref player 10))
    (e (string-ref player 13)))
    (if(eqv? a b)
       (if (eqv? b c)
           (if(eqv? c d)
              (if (eqv? d e)
                  #t
                  #f
                  )
              #f
              )
           #f
           )
       #f
        )
  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;sort part;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(display(trans-num(loadin 0)))
;(newline)
;(display(loadin 1))
(define (insertToSortedList element comparator lst)
  (cond
    [(or (empty? lst) (comparator element (first lst))) (cons element lst)]
    [else (cons (first lst) (insertToSortedList element comparator (rest lst)))]))

(define (sort-demo comparator lst)
  (cond
    [(empty? lst) empty]
    [else (insertToSortedList (first lst) comparator (sort-demo comparator (rest lst)))]))

;(sort-demo < (list 8 2 -7 6 33 2)) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;sorted transfered player data called playerx-new;;;;;;;;;;;;;;;;;;;;;;;;
(define (transfer player)
(cond((< (char->integer player)58)(- (char->integer player) 48))
     ((= (char->integer player) 65) 14)
     ((= (char->integer player) 84) 10)
     ((= (char->integer player) 74) 11)
     ((= (char->integer player) 81) 12)
     ((= (char->integer player) 75) 13))
  )

(define (player1-new i)
  (sort-demo > (list (transfer (string-ref(player1 i)0))
        (transfer (string-ref(player1 i)3))
        (transfer (string-ref(player1 i)6))
        (transfer (string-ref(player1 i)9))
        (transfer (string-ref(player1 i)12))))
  )

(define (player2-new i)
  (sort-demo > (list (transfer (string-ref(player2 i)0))
        (transfer (string-ref(player2 i)3))
        (transfer (string-ref(player2 i)6))
        (transfer (string-ref(player2 i)9))
        (transfer (string-ref(player2 i)12))))
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define(royal! player)
  (if(eq? (car  player) 14)
     (if(eq? (- (list-ref player 0) (list-ref player 4)) 4)
        #t
        #f
        )
     #f
     )
  #f
  )
(define(royal-flush! player)
  (let((a (string-ref player 1))
    (b (string-ref player 4))
    (c (string-ref player 7))
    (d (string-ref player 10))
    (e (string-ref player 13)))
    (if(eqv? a b)
       (if (eqv? b c)
           (if(eqv? c d)
              (if (eqv? d e)
                  ;(if(royal! player)
                     #t
 ;                    #f)
                  #f
                  )
              #f
              )
           #f
           )
       #f
        )
  )
  )


;i= 0~999 j=0/1
(define (straight-flush! i j)
  (if(= j 0)
     (player1 i)
     (player2 i)
     )


  )


(define (judge i)
(if(> (player1-marks i) (player2-marks i))
   (1)
   (0)
   )
  )


(define (player1-marks i)
  ()
  )


(define (player2-marks i)
  ()
  )