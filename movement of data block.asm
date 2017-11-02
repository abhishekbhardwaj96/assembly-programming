;THIS ASSEMBLY CODE PERFORM MOVE DATA BLOCKS
DATA SEGMENT
   ARRAY1  DB    23h,45h,67h,56h,12h
   ARRAY2  DB    5dup(0) 

DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA , CS:CODE  
    
    START:                  ; MAIN OF PROGRAM
          MOV AX,DATA       ;LOAD ADDRESS OF DATA SEGMENT TO AX
          MOV DS,AX         ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT
          
          MOV SI,0          ;SI IS USED TO INDEX THE ARRAY1 ELEMENT
          MOV DI,0          ;DI IS USED TO INDEX THE ARRAY2 ELEMENT
          
          
          LEA BX,ARRAY1     ;loads effective address of memory loaction named
                            ; array1 to bx register
                            
          LEA BP,ARRAY2     ;loads effective address of memory loaction named
                            ; array2 to bp register
          
          MOV CX,05h        ;number of times the loop to be executed
     
     
     NEXT: 
          MOV AL,BX[SI]     ;copies the byte content addressed
                            ; by bx and si registers to al register
          
          MOV BP[DI],AL     ;copies the content of al register to memory 
                            ;location addressed by bp and di registers
          
          INC SI            ; si=si+1
          INC DI            ; di=di+1
          
          LOOP NEXT         ;loop condition on cx is checked
 CODE ENDS
      END START