(define (find s predicate)
	(cond ((null? s) #f)
	      ((predicate (car s)) (car s))
	      (else (find (cdr-stream s) predicate)))
)

(define (scale-stream s k)
  (cond ((null? s) nil)
  		(else (cons-stream (* k (car s)) (scale-stream (cdr-stream s) k)))
  	)
)

(define (has-cycle s)
	(define (helper s2)
		(if (null? s2)
			 #f
			(if (eq? s2 s)
			 #t
			 (helper (cdr-stream s2))
			 )
		)
	)
	(helper (cdr-stream s))
)
(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
