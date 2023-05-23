org 100h

.MODEL small

.STACK 512d

.DATA
    inpu1     DB 10,13,'Enter the value of A:',10,13,'$'
    inpu2     DB 10,13,'Enter the value of B:',10,13,'$'
    inpu3     DB 10,13,'Enter the value of C:',10,13,'$'
    inpu4     DB 10,13,'Enter the value of D:',10,13,'$'
    inpu5     DB 10,13,'Enter the value of E:',10,13,'$'
    inpu6     DB 10,13,'Enter the value of F:',10,13,'$'
    inpu7     DB 10,13,'Enter the value of H:',10,13,'$'
    inpu8     DB 10,13,'Enter the value of L:',10,13,'$'
    BC DB ?   ; multiplication of b and to add with a
    ABC DB ?  ;to store A+B*C
    DH1 DB ?  ;multiplication of d and h to multiply with l
    DHL DB ? ;multiblication of d,h and l
    BF DB ? ; multiblication of b and f
    DE DB ?  ; multiplication of d and e
    DEB DB ? ;  multiplication of D and E  substract by B
    AD DB ? ; stores ABC minus DHL
    ADB DB ? ; stores AD divided by  bf
    FINAL DB ? ;Take the final result
    
    a            DB ?
    b            DB ?
    c            DB ?
    d            DB ?
    e            DB ?
    f            DB ?
    h            DB ?
    l            DB ?

.CODE

start:    
    call clearScreen

    lea dx,inpu1
    call printString
    mov ah,1
    int 21h
    mov a,al
    int 21h 

    lea dx,inpu2
    call printString
    mov ah,1
    int 21h
    mov b,al
    int 21h 

    lea dx,inpu3
    call printString
    mov cx, ax
    mov ah,1
    int 21h
    mov c,al
    int 21h 

    lea dx,inpu4
    call printString
    mov cx, ax
    mov ah,1
    int 21h
    mov d,al
    int 21h 
    
    lea dx,inpu5
    call printString
    mov cx, ax
    mov ah,1
    int 21h
    mov e,al
    int 21h 

    lea dx,inpu6
    call printString
    mov cx, ax
    mov ah,1
    int 21h
    mov f,al
    int 21h  

    lea dx,inpu7
    call printString
    mov cx, ax
    mov ah,1
    int 21h
    mov h,al
    int 21h 

    lea dx,inpu8
    call printString
    mov cx, ax
    mov ah,1
    int 21h
    mov l,al
    int 21h  

    sub a,48
    sub b,48
    sub c,48
    sub d,48
    sub e,48
    sub f,48
    sub h,48
    sub l,48
    xor ax,ax

    mov al,b
    mul c  ;multiply c with al and store the result on al
    mov BC,al ;The value is stored in variable BC
    xor al,al ;clear the values stored in al
    mov al,BC ;move the values of BC to al
    add al,a  ;add value of a with value of al, which is the value of BC
    mov ABC,al ; move the value of al to variable ABC
   
   
      xor al,al ;clear the value stored in al
      mov al,d  ;move d to al
      mul  h ;multiply value in h with value stored in al and store the value in al
      mov DH1 ,al ;move the result found in al to variable DH1
      xor al,al ;clear the value stored in al
      mov al,l ;move l to al
      mul DH1 ;multiply value stored in DH1 with value stored in al(which is value of l)
      mov DHL,al ;move the result of al to DH1
      xor al,al ;clear the value stored in al
      
      
      mov al,b ;move value in b to al
      mul  f ;multiply value in f with al
      mov BF ,al ;move result stored in al to BF
      xor al,al ;clear the value stored in al
      
      
    mov al,d ;move value in d to al 
    mul e  ;multiply value in e with al
    mov DE,al ;move result stored in al to variable DE
    xor al,al ;clear the value stored in al
    mov al,DE ;move value in DE to al
    sub al,b  ;subtract value stored in al to value in b (al-b)
    mov DEB,al ;move result stored in al to variable DEB
   
   
      xor al,al ;clear the value stored in al
      mov al,ABC ;move value stored in ABC to al
      sub al,DHL ;subtract value in al to value stored in DHL(al-DHL)
      mov AD,al ;move the result stored in al to AD
      xor al,al ;clear the value stored in al
      
      mov al,AD ;move the result stored in AD to al
      div BF ;divide value in al by value stored in BF
      mov ADB,al ;move the result stored in al to variable ADB
      xor al,al ;clear the value stored in al

      mov al,ADB ;move value stored in ADB to al
      mul DEB  ;multiply value stored in DEB to value in al
      mov FINAL,al ;move result in al to variable FINAL (which is the final result of equation)

 ;

ret
   
printString:

    mov ah, 09
    int 21h
    mov dx, 0 ;return things to normal
ret


clearScreen:
    xor ah, ah
    mov al, 03h ;breakpoint interrupt
    int 10h 
ret


