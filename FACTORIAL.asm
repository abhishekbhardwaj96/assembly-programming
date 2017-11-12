;Program to compute factorial of a number using procedure
DATA SEGMENT                  ;Start of data segment
    NO DW 7H                  ;NO of which factorial is to be find
    RESULT DW ?               ;Result at which factorial is to be find
DATA ENDS                     ;End of data data segment
CODE SEGMENT                  ;Start segment
    ASSUME DS:DATA CS:CODE
    START:                    ;Start of main program
           MOV AX,DATA        ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT 
           MOV DS,AX
           XOR AX,AX          ;AX is initialised with 0
           MOV AX,1H          ;Mov 1 in the ax
           CALL FACT          ;Calling the proceure
           
           FACT PROC          ;Starting of the procedure
            MOV BX,NO         ;Mov no in the bx register
            CMP BX,1          ;Compare BX with 1
            JE FINISH         ;if bx is 1 jump to finish label
            MUL NO            ;otherwise multiply no by ax
            DEC NO            ;and decrease the no
            
            CALL FACT         ;calling function recursivey
           FACT ENDP          ;end of procedure
           
    FINISH:MOV RESULT,AX      ;move the factorial in AX to result
CODE ENDS                     ;end of code segment 
END START                     ;end of program
           