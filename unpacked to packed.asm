;THIS ASSEMBLY CODE CONVERTS THE 16 DIGIT OF UNPACKED TO PACKED NUMBER

DATA SEGMENT                         ;STARTING OF DATA SEGMENT
 
    UNPACKED   DB 01H,02H,03H,04H,05H ,06H,07H,08H,09H,03H,04H,05H,06H,07H,08H,09H 
    ;16 DIGIT UNPACKED NUMBER
    
    
    PACKED DB 8 DUP(?)         ;PACKED NUMBER TO STORE 16 DIGITS

DATA ENDS                            ;END OF DATA SEGMENT

CODE SEGMENT                         ;STARTING OF CODE SEGMENT
    
    ASSUME DS:DATA,CS:CODE        

    START:                           ; MAIN OF PROGRAM
                                       
            MOV AX , DATA              ;LOAD ADDRESS OF DATA SEGMENT TO AX
            MOV DS , AX                ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT
            
            XOR AX,AX                  ;TO CLEAR THE AX REGISTER
            MOV SI , 0                 ;SI IS USED TO INDEX THE PACKED ELEMENT
            MOV DI , 0                 ;DI IS USED TO INDEX THE UNPACKED ELEMENT
            MOV CX , 8                 ;CX IS INTIALIZED WITH 8 TO EXECUTE LOOP 8 TIMES
            
    NEXT:                              ;REPEAT TILL CX = 0
            
            MOV AH,UNPACKED[DI]        ;MOV DI BYTE OF UNPACKED TO HIGHER BYTE OF AX
            INC DI
            MOV AL,UNPACKED[DI]        ;MOV DI BYTE OF UNPACKED TO LOWER BYTE OF AX
            SHL AL,4                   ;SHIFT LEFT ON LOWER BYTE OF AX BY 4
            SHR AX,4                   ;SHIFT RIGHT AX BY 4 
            MOV PACKED[SI],AL          ;STORE LOWER BYTE OF AX IN SI ELEMENT OF UNPACKED
            
                    
            INC DI
            INC SI  
            LOOP NEXT  
              
              
              
              
               
 
CODE ENDS                            ;END OF CODE SEGMENT
    END START                        ;END OF PRORAM





