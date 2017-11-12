;Program to perform lsearch by using procedure
DATA SEGMENT                                  ;Start of data segment
    ARRAY DB 01H,02H,03H,04H,05H              ;Array of elements
    ELEMENT DB 6H                             ;Element which we want to find
    INDEX DW ?                                ;Index of element 
    TABLE DW 2 DUP(?)                         ;Table which store offset of data
DATA ENDS                                     ;End of data segment

CODE SEGMENT                                  ;Start of code segment
    ASSUME CS:CODE,DS:DATA
    START:                                    ;Start of main program
           MOV AX,DATA                        ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT
           MOV DS,AX
           XOR AX,AX                          ;AX is initialised with 0
           MOV TABLE,OFFSET ARRAY             ;Mov offset of array in frst word of table
           MOV TABLE+2,OFFSET ELEMENT         ;Mov offset of element in second word of table
           MOV BX,OFFSET TABLE                ;Mov offset of table in BX
           CALL LSEARCH                       ;calling procedure LSEARCH
           
           LSEARCH PROC                       ;Start of procedure
            MOV SI,[BX]                       ;Mov address of array in SI
            MOV DI,[BX+2]                     ;Mov address of element in DI
            MOV CX,5                          ;CX IS INTIALIZED WITH 5 TO EXECUTE LOOP 5 TIMES
            MOV AH,[DI]                       ;Mov element to be find in AH  
    NEXT:   
            
            CMP AH,[SI]                       ;Compare the element with si element of array
            JE FOUND                          ;If found then move to found label
            INC SI                            ;otherwise increase SI
            LOOP NEXT
   NOT_FOUND:                                 ;If element is not in array
            MOV INDEX,-1H
            JMP EXIT
   FOUND:                                     ;If element is in the array
            MOV INDEX,SI                      ;Mov the index at which no is found in index
            JMP EXIT
   EXIT:
CODE ENDS                                     ;End of code segment
END START                                     ;End of main program
