; Ethan Trott
; COS 301
; a function to produce the postorder of a list representation of a binary tree

; tree structure: '(element (left child) (right child))
; tree need not be null terminated

; example tree: '(1 (2 (3)) (4 (5) (6)) )
;        1
;    2      4
;  3  *    5  6
; result: (3 2 5 6 4 1)

; another example tree: '(1 (2 (3 (4) (5)) (6 () (7)) ) ( 8 () (9 (10) ) ))
;          1
;     2         8
;  3    6    *    9   
; 4 5  * 7  * * 10  *
; result: (4 5 3 7 6 2 10 9 8 1)

; returns postorder list of elements in binary tree t
(define (postorder t)
    (if (not (null? t))
        ; if the tree is not empty, traverse contents
        (cond
            ; case 1 (no children): (element) 
            ; just return the element
            ((= (length t) 1) 
                t
            )

            ; case 2 (one child): (element (left_subtree)) 
            ; return (postorder(left_subtree) element)
            ((= (length t) 2)
                (append
                    (postorder (cadr t))
                    (list (car t))
                )
            )

            ; case 3 (two children): (element (left_subtree) (right_subtree)) 
            ; return (postorder(left_subtree) postorder(right_subtree) element)
            ((= (length t) 3)
                (append
                    (postorder (cadr t))
                    (postorder (caddr t))
                    (list (car t))
                )
            )
        )
        
        ; if the tree is empty, return empty list
        '()
    )
)