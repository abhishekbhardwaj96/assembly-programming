;THIS ASSEMBLY CODE CONVERTS THE 16 DIGIT OF PACKED TO UNPACKED NUMBER

DATA SEGMENT                         ;STARTING OF DATA SEGMENT
 
    PACKED   DB 23H,45H,67H,89H,24H ,66H , 54H ,78H 
    ;16 DIGIT PACKED NUMBER
    
    
    UNPACKED DB 16 DUP(?)         ;UNPACKED NUMBER TO STORE 16 DIGITS

DATA ENDS                            ;END OF DATA SEGMENT

CODE SEGMENT                         ;STARTING OF CODE SEGMENT
    
    ASSUME DS:DATA,CS:CODE        

    START:                           ; MAIN OF PROGRAM
                                       
            MOV AX , DATA              ;LOAD ADDRESS OF DATA SEGMENT TO AX
            MOV DS , AX                ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT
            
            
            MOV SI , 0                 ;SI IS USED TO INDEX THE PACKED ELEMENT
            MOV DI , 0                 ;DI IS USED TO INDEX THE UNPACKED ELEMENT
            MOV CX , 8                 ;CX IS INTIALIZED WITH 8 TO EXECUTE LOOP 8 TIMES
            
    NEXT:                              ;REPEAT TILL CX = 0
            XOR AX,AX                  ;TO CLEAR THE AX REGISTER
            MOV AL,PACKED[SI]          ;MOV SI BYTE OF PACKED TO AL
            SHL AX,4                   ;SHIFT LEFT AX BY 4
            SHR AL,4                   ;SHIFT RIGHT ON LOWER BYTE OF AX BY 4 
            MOV UNPACKED[DI],AH        ;STORE HIGHER BYTE OF AX IN DI ELEMENT OF UNPACKED
            INC DI
            MOV UNPACKED[DI],AL        ;STORE LOWER BYTE OF AX IN DI ELEMENT OF UNPACKED
            INC DI
            INC SI  
            LOOP NEXT  
              
              
              
              
               
 
CODE ENDS                            ;END OF CODE SEGMENT
    END START                        ;END OF PRORAM





