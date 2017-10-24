;THIS ASSEMBLY CODE CONVERTS THE 16 DIGIT OF PACKED TO UNPACKED NUMBER

DATA SEGMENT                     ;STARTING OF DATA SEGMENT
                    
    PACKED      DB  45H,33H,67H,12H,58H,89H,14H,83H    
    ;16 DIGIT PACKED NUMBER 
    UNPACKED    DB  16 DUP(?)    ;UNPACKED NUMBER TO STORE 16 DIGITS                          
    
DATA ENDS                        ;END OF DATA SEGMENT
                                 


CODE SEGMENT                     ;STARTING OF DATA SEGMENT
    
    ASSUME  DS:DATA
    ASSUME  CS:CODE
    
    START:			 ; use colon after label without giving any space
            MOV AX, DATA         ;LOAD ADDRESS OF DATA SEGMENT TO AX
            MOV DS, AX           ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT
            
            MOV CX,8H
            
            MOV SI,0             ;SI IS USED TO INDEX THE PACKED ELEMENT
            MOV DI,0             ;DI IS USED TO INDEX THE UNPACKED ELEMENT
            
            MOV BL,0FH           ;USED FOR MASKING
            
    NEXT:                        ;REPEAT TILL CX = 0
                                 
            XOR AX,AX            ;TO CLEAR THE AX REGISTER 
            
	        MOV AL,PACKED[SI]    ;MOV SI BYTE OF PACKED TO AL
	        MOV AH,PACKED[SI]    ;MOV SI BYTE OF PACKED TO AH
                  
	        ROR AH,4             ;ROTATE HIGHER BYTE OF AX BY 4
	        
	        AND AL,BL            ;MASKING (AND WITH 00001111)
	        AND AH,BL            ;MASKING (AND WITH 00001111)
	        
	        INC SI   
	        
	        MOV UNPACKED[DI], AH ;STORE HIGHER BYTE OF AX IN DI ELEMENT OF UNPACKED
	        INC DI
	        MOV UNPACKED[DI],AL  ;STORE HIGHER BYTE OF AX IN DI ELEMENT OF UNPACKED
	        INC DI        
	        
            LOOP NEXT 
            
            
CODE ENDS                        ;END OF CODE SEGMENT
    END START                    ;END OF PROGRAM
