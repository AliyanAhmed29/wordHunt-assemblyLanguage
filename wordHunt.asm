[org 0x100]

jmp start
;________________________________________________________________


; midpoints of boxes
;row1:  1154, 1168, 1182, 1196
;row2:  1794, 1808, 1822, 1836
;row3:   2434, 2448, 2462, 2476
;row4:   3074, 3088, 3102, 3116


;---------------------------------------------------------------
;---------------------------------------------------------------
;	MY DICTIONARY
;---------------------------------------------------------------
;---------------------------------------------------------------

str1: db 'fast'
str2: db 'lums'
str3: db 'nust'
str4: db 'giki'
;---------------------------------------------------------------
;---------------------------------------------------------------
;	MY DICTIONARY ENDED
;---------------------------------------------------------------
;---------------------------------------------------------------


;==================================
;	VARIABLES
;==================================

mystring: db 'ffff'		;size=4

found1: dw -1		;found ("0")  , notFound ("1")  ,("-1")defaultValue
found2: dw -1		;found ("0")  , notFound ("1")  ,("-1")defaultValue
found3: dw -1		;found ("0")  , notFound ("1")  ,("-1")defaultValue
found4: dw -1		;found ("0")  , notFound ("1")  ,("-1")defaultValue


success: db 'YOUR STRING HAS BEEN FOUND'
failure: db 'NO STRING MATCHED...SO SAD!!!'
gameOver: db 'GAME OVER GUYS'

;==================================
;	VARIABLES ENDED
;==================================




;===============================================================================================
;===============================================================================================
;			FIRST SCREEN CODE
;===============================================================================================
;===============================================================================================


;===============================================================================================
;			CLEAR SCREEN
;===============================================================================================
;________________________________________________________________

clearScreen:

	push es 
 	push ax 
 	push di

	mov ax, 0xb800 
 	mov es, ax ; 
 	mov di, 0 

nextloc: 
	mov word [es:di], 0x0720 
 	add di, 2 
 	cmp di, 4000  
	jne nextloc  
 

	pop di
	pop ax
	pop es

	ret 
;________________________________________________________________
;===============================================================================================
;			CLEAR SCREEN ENDED
;===============================================================================================






;===================================================================
;			PRINT EACH BOX
;===================================================================
printEachBox:

	push bp
	mov bp,sp
	


mov ax,0xb800
mov es,ax

mov cx,5
mov di,word[bp+4]			;starting position (top left)

mov ax,0
mov ah,byte[bp+7]			;color
mov al,0h

l1:
	mov [es:di],ax
	add di,2
	loop l1

mov cx,5
add di,150
l2:
	mov [es:di],ax
	add di,2
	loop l2


mov cx,5
add di,150
l3:
	mov [es:di],ax
	add di,2
	loop l3




	pop bp
	ret 4
;===================================================================
;			PRINT EACH BOX ENDED
;===================================================================





;===================================================================
;			PRINT BOXES
;===================================================================

printBoxes:
;---------------


mov ah,00110000b
mov al,0h
push ax
	mov ax,990
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax

	mov ax,1630
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax

	mov ax,2270
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax

	mov ax,2910
	push ax
	call printEachBox
;____________________________________________
mov ah,00110000b
mov al,0h
push ax

	mov ax,1004
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax

	mov ax,1644
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax

	mov ax,2284
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax

	mov ax,2924
	push ax
	call printEachBox
;____________________________________________

mov ah,00110000b
mov al,0h
push ax
	mov ax,1018
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax

	mov ax,1658
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax

	mov ax,2298
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax

	mov ax,2938
	push ax
	call printEachBox
;____________________________________________

mov ah,00110000b
mov al,0h
push ax


	mov ax,1032
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax


	mov ax,1672
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax


	mov ax,2312
	push ax
	call printEachBox

mov ah,00110000b
mov al,0h
push ax

	mov ax,2952
	push ax
	call printEachBox



;-------------------------------------------------
	ret


;===================================================================
;			PRINT BOXES ENDED
;===================================================================
















;===============================================================================================
;===============================================================================================
;			FIRST SCREEN CODE ENDED
;===============================================================================================
;===============================================================================================








;===============================================================================================
;			PRINT STRING
;===============================================================================================
;_______
printstr: 
;_______

	push bp 
 	mov bp, sp 
	push es 
 	push ax 
 	push cx 
 	push si 
 	push di 

 	mov ax, 0xb800 
 	mov es, ax 
 	mov di, [bp+8] 
 	mov si, [bp+6]  
 	mov cx, [bp+4] 
 	mov ah, 0x07 

nextchar:
 	mov al, [si] 

 	mov [es:di], ax  
 	add di, 2  
 	add si, 1 
	loop nextchar  

 	pop di 
 	pop si 
 	pop cx 
 	pop ax 
 	pop es 
 	pop bp 	
	ret 6

;===============================================================================================
;				PRINT STRING ENDED
;===============================================================================================


;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;				COMPARISON FUNCTIONS UP HERE
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


;===============================================================================================
;				COMPARE String "1"
;===============================================================================================
compareStr1:

	pusha
;____________________
mov ax,0
mov bx,0
mov cx,4
mov si,0

cmpLoopS1:

	mov al,byte[mystring+si]	;the input
	mov bl,byte[str1+si]		;the first dictionary word


	cmp al,bl
	jne misMatchS1		;red flag bro

	add si,1

	loop cmpLoopS1

	jmp matchedS1		;WOWW 

misMatchS1:
	
	mov ax,0xb800
	mov es,ax
mov ax,0
mov ah,01110000b
mov al,"0"
	mov word[es:634],ax
	mov word[found1],0		;notFound
	jmp endS1

matchedS1:
	mov ax,0xb800
	mov es,ax
mov ax,0
mov ah,01110000b
mov al,"1"
	mov word[es:634],ax
	mov word[found1],1		;Found successfully

endS1:
;______________________
	popa
	ret




;===============================================================================================
;				COMPARE String "1" ENDED
;===============================================================================================




;===============================================================================================
;				COMPARE String "2"
;===============================================================================================
compareStr2:

	pusha
;____________________
mov ax,0
mov bx,0
mov cx,4
mov si,0

cmpLoopS2:

	mov al,byte[mystring+si]	;the input
	mov bl,byte[str2+si]	;the second dictionary word


	cmp al,bl
	jne misMatchS2		;red flag bro

	add si,1

	loop cmpLoopS2

	jmp matchedS2		;WOWW 

misMatchS2:
	
	mov ax,0xb800
	mov es,ax
mov ax,0
mov ah,01110000b
mov al,"0"
	mov word[es:794],ax
	mov word[found2],0		;notFound
	jmp endS1

matchedS2:
	mov ax,0xb800
	mov es,ax
mov ax,0
mov ah,01110000b
mov al,"1"
	mov word[es:794],ax
	mov word[found2],1		;Found successfully

endS2:
;______________________
	popa
	ret




;===============================================================================================
;				COMPARE String "2" ENDED
;===============================================================================================




;===============================================================================================
;				COMPARE String "3"
;===============================================================================================
compareStr3:

	pusha
;____________________
mov ax,0
mov bx,0
mov cx,4
mov si,0

cmpLoopS3:

	mov al,byte[mystring+si]	;the input
	mov bl,byte[str3+si]		;the third dictionary word


	cmp al,bl
	jne misMatchS3		;red flag bro

	add si,1

	loop cmpLoopS3

	jmp matchedS3		;WOWW 

misMatchS3:
	
	mov ax,0xb800
	mov es,ax
mov ax,0
mov ah,01110000b
mov al,"0"
	mov word[es:954],ax
	mov word[found3],0		;notFound
	jmp endS1

matchedS3:
	mov ax,0xb800
	mov es,ax
mov ax,0
mov ah,01110000b
mov al,"1"
	mov word[es:954],ax
	mov word[found3],1		;Found successfully

endS3:
;______________________
	popa
	ret




;===============================================================================================
;				COMPARE String "3" ENDED
;===============================================================================================




;===============================================================================================
;				COMPARE String "4"
;===============================================================================================
compareStr4:

	pusha
;____________________
mov ax,0
mov bx,0
mov cx,4
mov si,0

cmpLoopS4:

	mov al,byte[mystring+si]	;the input
	mov bl,byte[str4+si]		;the third dictionary word


	cmp al,bl
	jne misMatchS4		;red flag bro

	add si,1

	loop cmpLoopS4

	jmp matchedS4		;WOWW 

misMatchS4:
	
	mov ax,0xb800
	mov es,ax
mov ax,0
mov ah,01110000b
mov al,"0"
	mov word[es:1114],ax
	mov word[found4],0		;notFound
	jmp endS1

matchedS4:
	mov ax,0xb800
	mov es,ax
mov ax,0
mov ah,01110000b
mov al,"1"
	mov word[es:1114],ax
	mov word[found4],1		;Found successfully

endS4:
;______________________
	popa
	ret




;===============================================================================================
;				COMPARE String "4" ENDED
;===============================================================================================













;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;				COMPARISON FUNCTIONS ENDED
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



;===============================================================================================
;				ALL COMPARISONS
;===============================================================================================

doAllComparisons:
	pusha
;___________________

	call compareStr1
	cmp word[found1],1
	jne second

;-------------------------------------------------
;-------------------------------------------------
;	CONGRATS 
;-------------------------------------------------
;-------------------------------------------------
	mov ax,510	;starting offset (bp+8)
	push ax
	mov ax, success
 	push ax 
 	mov ax,26
	push ax 
 	call printstr
	jmp cmpEnded
;-------------------------------------------------
;-------------------------------------------------



second:
	call compareStr2
	cmp word[found2],1
	jne third
;-------------------------------------------------
;-------------------------------------------------
;	CONGRATS 
;-------------------------------------------------
;-------------------------------------------------
	mov ax,510	;starting offset (bp+8)
	push ax
	mov ax, success
 	push ax 
 	mov ax,26
	push ax 
 	call printstr
	jmp cmpEnded
;-------------------------------------------------
;-------------------------------------------------



third:
	call compareStr3
	cmp word[found3],1
	jne fourth

;-------------------------------------------------
;-------------------------------------------------
;	CONGRATS 
;-------------------------------------------------
;-------------------------------------------------
	mov ax,510	;starting offset (bp+8)
	push ax
	mov ax, success
 	push ax 
 	mov ax,26
	push ax 
 	call printstr
	jmp cmpEnded
;-------------------------------------------------
;-------------------------------------------------



fourth:
	call compareStr4
	cmp word[found4],1
	jne NOTFOUNDBRO

;-------------------------------------------------
;-------------------------------------------------
;	CONGRATS 
;-------------------------------------------------
;-------------------------------------------------
	mov ax,510	;starting offset (bp+8)
	push ax
	mov ax, success
 	push ax 
 	mov ax,26
	push ax 
 	call printstr
	jmp cmpEnded
;-------------------------------------------------
;-------------------------------------------------




NOTFOUNDBRO:
;-------------------------------------------------
;-------------------------------------------------
;	FAILURE
;-------------------------------------------------
;-------------------------------------------------
	mov ax,510	;starting offset (bp+8)
	push ax
	mov ax, failure
 	push ax 
 	mov ax,29
	push ax 
 	call printstr
;-------------------------------------------------
;-------------------------------------------------

	


cmpEnded:
;___________________
	popa
	ret


;===============================================================================================
;				ALL COMPARISONS ENDED
;===============================================================================================





;===============================================================================================
;				INPUT
;===============================================================================================
 
input:
	pusha
;________________

	mov cx,4			;only four inputs

	mov si,mystring

myloop:
	mov ah,1
	int 21h
	mov [si],al

	add si,1			;next index
	loop myloop



;________________
	popa
	ret
;===============================================================================================
;				INPUT ENDED
;===============================================================================================



;===============================================================================================
;					OUTPUT
;===============================================================================================
 
output:
	pusha
;________________


	mov ax,2020	;starting offset (bp+8)
	push ax
	mov ax, mystring
 	push ax 
 	mov ax,4
	push ax 
 	call printstr


;________________
	popa
	ret
;===============================================================================================
;				OUTPUT ENDED
;===============================================================================================

;row1:  1154, 1168, 1182, 1196
;row2:  1794, 1808, 1822, 1836
;row3:   2434, 2448, 2462, 2476
;row4:   3074, 3088, 3102, 3116


;===============================================================================================
;				print all strings
;===============================================================================================

printAllStrings:
	pusha
;__________________
mov ax,0xb800
mov es,ax
 
mov ax,0
mov ah,00110000b		;black on sky blue

;____________________string one_____________________
	mov al,[str1]
	mov word[es:1154],ax

	mov al,[str1+1]
	mov word[es:1168],ax

	mov al,[str1+2]
	mov word[es:1182],ax

	mov al,[str1+3]
	mov word[es:1196],ax
;____________________string one done_____________________


;____________________string two_____________________
	mov al,[str2]
	mov word[es:1794],ax

	mov al,[str2+1]
	mov word[es:1808],ax

	mov al,[str2+2]
	mov word[es:1822],ax

	mov al,[str2+3]
	mov word[es:1836],ax
;____________________string two done_____________________


;____________________string three_____________________
	mov al,[str3]
	mov word[es:2434],ax

	mov al,[str3+1]
	mov word[es:2448],ax

	mov al,[str3+2]
	mov word[es:2462],ax

	mov al,[str3+3]
	mov word[es:2476],ax
;____________________string three done_____________________



;____________________string four_____________________
	mov al,[str4]
	mov word[es:3074],ax

	mov al,[str4+1]
	mov word[es:3088],ax

	mov al,[str4+2]
	mov word[es:3102],ax

	mov al,[str4+3]
	mov word[es:3116],ax
;____________________string four done_____________________








;_________________
	popa
	ret


;===============================================================================================
;				print all strings ended
;===============================================================================================




;===============================================================================================
;				START FUNCTION
;===============================================================================================


;________________________________________________________________
start:

	call clearScreen
;________________________________________________________________


	call printBoxes
	call printAllStrings

playAgain:
	call input			;take 4 keystrokes
	call output		;output those 4 keystrokes
	call doAllComparisons	;cmp with all words in dictionaries

	mov ah, 0 		; service 0 – get keystroke
	int 0x16 			; call BIOS keyboard service
	cmp al, 27 		; is the Esc key pressed
	jne playAgain

	call clearScreen


	mov ax,1980	;starting offset (bp+8)
	push ax
	mov ax, gameOver
 	push ax 
 	mov ax,14
	push ax 
 	call printstr

	mov ah, 0 		; service 0 – get keystroke
	int 0x16 			; call BIOS keyboard service

	call clearScreen

;________________________________________________________________
terminate:
;________________________________________________________________
mov ax,0x4c00
int 21h
