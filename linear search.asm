;THIS ASSEMBLY CODE PERFORM THE LINEAR SEARCH 

DATA SEGMENT                         ;STARTING OF DATA SEGMENT
    ARRAY    DB   05H,09H,07H,02H,08H
    ELEMENT  DB   08H
    INDEX    DW   ?
                         
                                                                                                                            

DATA ENDS                            ;END OF DATA SEGMENT

CODE SEGMENT                         ;STARTING OF CODE SEGMENT
    
    ASSUME DS:DATA,CS:CODE        

    START:                           ; MAIN OF PROGRAM
                                       
            MOV AX , DATA              ;LOAD ADDRESS OF DATA SEGMENT TO AX
            MOV DS , AX                ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT
            
            XOR AX,AX                  ;TO CLEAR THE AX REGISTER
            
            MOV SI , 0                 ;SI IS USED TO INDEX THE PACKED ELEMENT
            MOV CX , 5                 ;CX IS INTIALIZED WITH 5 TO EXECUTE LOOP 5 TIMES
            MOV AL,ELEMENT             ;MOV THE ELEMENT TO BE FOUND IN LOWER BYTE OF AX
            
    NEXT:                              ;LOOP EXECUTE TILL CX=0
            CMP AL,ARRAY[SI]           ;COMPARE THE ELEMENT TO BE SEARCH WITH THE SI ELEMENT OF ARRAY
            JE FOUND                   ;IF ELEMENT IS FOUND THEN JUMP TO FOUND LABEL
            INC SI
            LOOP NEXT                  ;IF ELEMENT IS NOT IN THE ARRAY JUMP TO NOT_FOUND LABEL
            JMP NOT_FOUND
            
    FOUND:                             ;IF ELEMENT IS FOUNF THEN THIS BLOCK IS EXECUTE
            MOV INDEX,SI               ;MOV THE SI TO INDEX AT WHICH ELEMENT FOUND
            JMP EXIT
        
    NOT_FOUND:                         ;IF ELEMENT IS FOUNF THEN THIS BLOCK IS EXECUTE
            MOV INDEX,-1               ; MOVE -1 TO INDEX AFTER NOT FINDING THE ELEMENT IN ARRAY
        
    EXIT:         
              
              
              
               
 
CODE ENDS                            ;END OF CODE SEGMENT
    END START                        ;END OF PRORAM





