;Program to compute the matrix addition
DATA SEGMENT                           ;Start of data segment
    MATRIX1 DB 01H,02H,03H             ;Initialising matrix 1
            DB 04H,05H,06H
            DB 07H,08H,09H
    
    MATRIX2 DB 09H,08H,07H             ;Initialising matrix 2
            DB 06H,05H,04H
            DB 03H,02H,01H
         
    SUM DB 9 DUP(?)                    ;sum to store the matrix addition
    
DATA ENDS                              ;End of the data segment

CODE SEGMENT                           ;Start of data segment
    ASSUME: DS:DATA,CS:CODE
    START:                             ;Start of data segment
            MOV AX,DATA                ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT 
            MOV DS,AX
            MOV CX,3                   ;Mov 3 in CX for outer loop 
            MOV SI,0                   ;initialise SI for row index
            
            XOR AX,AX                  ;AX is initialised with 0
    NEXT:                              ;Start of outer loop
            PUSH CX                    ;Push Value of CX
            MOV BP,0
            MOV CX,3                   ;Mov 3 in CX for inner loop
    NEXT1:                             ;start of inner loop
            MOV AL,MATRIX1[SI]BP]      ;Mov BP element of SI row in AL
            ADD AL,MATRIX2[SI][BP]     ;ADD BP element of SI row in AL
            MOV SUM[SI][BP],AL         ;Mov BP element of SI row in SUM
            INC BP                     ;Inc BP for next element
            LOOP NEXT1                 
            ADD SI,3                   ;Inc SI by 3 to indicate next row
            POP CX                     ;Pop outer loop cx
            LOOP NEXT
CODE ENDS                              ;End of code segment
END START                              ;End of start
            