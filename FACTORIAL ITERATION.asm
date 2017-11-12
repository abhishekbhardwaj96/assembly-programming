DATA SEGMENT
    NO DW 5H
    RESULT DW ?
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA,CS:CODE
    START:
           MOV AX,DATA
           MOV DS,AX
           XOR AX,AX
           MOV AX,1H
           MOV CX,NO
    NEXT:  
           MOV BX,NO
           MUL NO
           DEC NO
           LOOP NEXT
           MOV RESULT,AX
CODE ENDS
END SEGMENT