DSEG    SEGMENT
BlockA  DB 8 dup(?)
blockB  DB 8 dup(?)
DSEG    ENDS       
SSEG    SEGMENT STACK
        DB 100H DUP(?)
SSEG    ENDS
CSEG    SEGMENT
        ASSUME CS:CSEG,DS:DSEG,SS:SSEG
BEGIN:  MOV AX,DSEG
        MOV DS,AX 
        
        MOV SI,0
        MOV CX,8 
        
        LEA SI,BlockA
        MOV AH,40H
        CALL INSERT 
                     
                     
        MOV AH,50H
        LEA SI,BlockB
        MOV CX,8
        CALL INSERT
        JMP SOF
        
        
        
INSERT: 

        L:
        MOV [SI],AH
        INC SI
        LOOP L
        
        RET
SOF:
                
        
        
 

        
CSEG    ENDS
END     BEGIN  