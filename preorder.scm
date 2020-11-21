; Ethan Trott
; COS 301
; a function to produce the preorder of a list representation of a binary tree

; tree structure: '(element (left child) (right child))
; tree need not be null terminated

; example tree: '(1 (2 (3)) (4 (5) (6)) )
;        1
;    2      4
;  3  *    5  6
; result: (1 2 3 4 5 6)

; another example tree: '(1 (2 (3 (4) (5)) (6 () (7)) ) ( 8 () (9 (10) ) ))
;          1
;     2         8
;  3    6    *    9   
; 4 5  * 7  * * 10  *
; result: (1 2 3 4 5 6 7 8 9 10)

; returns preorder list of elements in binary tree t
(define (preorder t)
    (if (not (null? t))
        ; if the tree is not empty, traverse contents
        (cond
            ; case 1 (no children): (element) 
            ; just return the element
            ((= (length t) 1) 
                t
            )

            ; case 2 (one child): (element (left_subtree)) 
            ; return (element preorder(left_subtree))
            ((= (length t) 2)
                (append
                    (list (car t))
                    (preorder (cadr t))
                )
            )

            ; case 3 (two children): (element (left_subtree) (right_subtree)) 
            ; return (element preorder(left_subtree) preorder(right_subtree))
            ((= (length t) 3)
                (append
                    (list (car t))
                    (preorder (cadr t))
                    (preorder (caddr t))
                )
            )
        )
        
        ; if the tree is empty, return empty list
        '()
    )
)