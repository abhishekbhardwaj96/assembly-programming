DATA SEGMENT
    MATRIX1 DB 01H,02H,03H
            DB 04H,05H,06H
            DB 07H,08H,09H
    
    MATRIX2 DB 09H,08H,07H
            DB 06H,05H,04H
            DB 03H,02H,01H
         
    SUM DB 9 DUP(?)
    
DATA ENDS

CODE SEGMENT
    ASSUME: DS:DATA,CS:CODE
    START:
            MOV AX,DATA
            MOV DS,AX
            MOV CX,3
            MOV SI,0
            
            XOR AX,AX
    NEXT:   
            PUSH CX
            MOV BP,0
            MOV CX,3
    NEXT1:  
            MOV AL,MATRIX1[SI]BP]
            ADD AL,MATRIX2[SI][BP]
            MOV SUM[SI][BP],AL
            INC BP
            LOOP NEXT1  
            ADD SI,3
            POP CX
            LOOP NEXT
CODE ENDS
END START
            