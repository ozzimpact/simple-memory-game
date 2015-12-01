TITLE Program Template     (template.asm)

; Program Description:
; Author:
; Date Created:
; Last Modification Date:


INCLUDE Irvine32.inc
INCLUDE macros.inc

.data
rply byte 0
md byte 0
score1 dword 0
score2 dword 0
score3 dword 0
randval dword 0
client dword 0
cor2 dword 0
cor1 dword 0
actual byte 36 dup(0)
temp_co dword 0
coor dword ?
temp_edi dword ?
count dword ?
temp dword ?
temp_esi dword ?
letter byte 32,65,66,67,68,69,70
number byte 49,50,51,52,53,54
arraych byte 58,60,61,62,63,64,
	58,60,61,62,63,64,
	91,92,93,94,95,96,
	91,92,93,94,95,96,
	225,168,164,178,128,230,
	225,168,164,178,128,230
select byte 0
input1 byte 128 dup(0)
input2 byte 128 dup(0)
name1 dword 128 dup(0)
name2 dword 128 dup(0)
name3 dword 128 dup(0)
name5 byte "Computer",0
.code
main PROC
call randarray
_again:
call clrscr
mwrite "Welcome to Memory Game"
call crlf
mwrite "1. <Player vs Player>"
call crlf
mwrite "2. <Player vs Computer>"
call crlf
_begin:
mwrite "Select Game Mode : "
call readchar
mov select,al
call writechar
call crlf
cmp al,49
je _pvp
cmp al,50
je _pvc





mwrite "You entered invalid number!"
mov al,7
call writechar
call crlf
jmp _begin
 
_pvc:
mov md,2
mwrite "Enter player name: "
mov edx,offset name1
mov ecx,lengthof name1-1
call readstring


mov eax,500
call delay
call clrscr
call screen
call crlf

call randclient

jmp _startup2
_pvp:

mwrite "Enter 1st player name: "
mov edx,offset name1
mov ecx,lengthof name1-1
call readstring

mwrite "Enter 2nd player name: "
mov edx,offset name2
mov ecx,lengthof name2-1
call readstring


mov eax,500
call delay
call clrscr
call screen
call crlf

call randclient

_startup2:

cmp client,1
je _p1

_p2:
cmp md,2
je _eq
mov eax,offset name2
mov name3,eax
mov ebx,score2
mov score3,ebx
jmp _startup

_eq:
mov eax,offset name5
mov name3,eax
mov ebx,score2
mov score3,ebx
jmp _startup

_p1: 

mov eax,offset name1
mov name3,eax
mov ebx,score1
mov score3,ebx



;--------------------------------------------------------------------------------------------------------------------
jmp _startup

_inval1:
mwrite "You entered invalid character!"
call crlf
mov al,7
call writechar
call crlf
_startup:;------------------------------------------------------------------------------------------------------------------------

cmp md,2
jne _ara
cmp client,2
je _eq2
jmp _ara

_ara2:
mwrite "You entered invalid character!"
call crlf
mov al,7
call writechar

_ara:
mov edx,name3
call writestring
mwrite ", enter the first coordinate : "
mov ecx,sizeof input1
mov edx,offset input1

call readstring
cmp input1[2],0
jne _ara2

;2. koordinat



mov esi,0
mov edi,0


mov ecx,2
l1:
cmp input1[edi],'a'
je _A
cmp input1[edi],'A'
je _A
cmp input1[edi],'b'
je _B
cmp input1[edi],'B'
je _B
cmp input1[edi],'c'
je _C
cmp input1[edi],'C'
je _C
cmp input1[edi],'d'
je _D
cmp input1[edi],'D'
je _D
cmp input1[edi],'e'
je _E
cmp input1[edi],'E'
je _E
cmp input1[edi],'f'
je _F
cmp input1[edi],'F'
je _F

cmp edi,1
je _ara2
inc edi
	loop l1

_A:
cmp edi,0
jmp _cont

_B:
add esi,1
jmp _cont

_C:
add esi,2
jmp _cont

_D:
add esi,3
jmp _cont

_E:
add esi,4
jmp _cont

_F:
add esi,5
jmp _cont



_cont:
mov ecx,2
mov edi,0

l2:

cmp input1[edi],'1'
je _one
cmp input1[edi],'2'
je _two
cmp input1[edi],'3'
je _three
cmp input1[edi],'4'
je _four
cmp input1[edi],'5'
je _five
cmp input1[edi],'6'
je _six
cmp edi,1
je _inval1
inc edi
	loop l2



_one:
jmp _final1
_two:
add esi,6
jmp _final1

_three:
add esi,12
jmp _final1

_four:
add esi,18
jmp _final1

_five:
add esi,24
jmp _final1

_six:
add esi,30
jmp _final1

_final1:

mov cor1,esi
mov eax,cor1

cmp actual[esi],1
je _err
mov actual[esi],1
call screen
jmp _secondary
_err:
mwrite "You entered this coordinate before!"
mov al,7
call writechar
call crlf
jmp _startup  
;-----------------------------------------------------------------------------------------------------------------
;haniiiiiiiiiiiiiiiiii
_inval2:
mwrite "You entered invalid character!"
mov al,7
call writechar
call crlf
_secondary:

mov edx,name3
call writestring
mwrite " , enter the second coordinates: "
mov edx,offset input2
mov ecx,sizeof input2-1

call readstring

cmp input2[2],0
jne _inval2
mov esi,0
mov edi,0

mov ecx,2
l21:
cmp input2[edi],'a'
je _A2

cmp input2[edi],'A'
je _A2

cmp input2[edi],'b'
je _B2

cmp input2[edi],'B'
je _B2

cmp input2[edi],'c'
je _C2

cmp input2[edi],'C'
je _C2

cmp input2[edi],'d'
je _D2

cmp input2[edi],'D'
je _D2

cmp input2[edi],'e'
je _E2

cmp input2[edi],'E'
je _E2

cmp input2[edi],'f'
je _F2

cmp input2[edi],'F'
je _F2

cmp edi,1
je _inval2 


inc edi
	loop l21

_A2:
cmp edi,0
jmp _cont2

_B2:
add esi,1
jmp _cont2

_C2:
add esi,2
jmp _cont2

_D2:
add esi,3
jmp _cont2

_E2:
add esi,4
jmp _cont2

_F2:
add esi,5
jmp _cont2



_cont2:
mov ecx,2
mov edi,0

l22:

cmp input2[edi],'1'
je _one2
cmp input2[edi],'2'
je _two2
cmp input2[edi],'3'
je _three2
cmp input2[edi],'4'
je _four2
cmp input2[edi],'5'
je _five2
cmp input2[edi],'6'
je _six2
cmp edi,1
je _inval2
inc edi
	loop l22



_one2:
jmp _final2

_two2:
add esi,6
jmp _final2

_three2:
add esi,12
jmp _final2

_four2:
add esi,18
jmp _final2

_five2:
add esi,24
jmp _final2

_six2:
add esi,30
jmp _final2


_final2:
mov cor2,esi
mov eax,cor2
cmp actual[esi],1
je _err2
mov actual[esi],1
call screen
jmp conti

_err2:
mwrite "You entered this coordinate before!"
mov al,7
call writechar
call crlf
jmp _secondary  

_eq2:
call randcomp
call screen

conti:
mov esi,cor1
mov edi,cor2
mov al,arraych[esi]
cmp al,arraych[edi]
je _yey
mov actual[esi],0
mov actual[edi],0
cmp client,1
je _mk
mov client,1
jmp _scor
_mk:
mov client,2
jmp _scor
_yey:

cmp client,1
jne _sc2
inc score1
jmp _scor
_sc2:
inc score2
_scor:
mov eax,1000
call delay
call clrscr
call screen
call crlf


mov edx,offset name1
call writestring
mwrite " = "
mov eax,score1
call writedec

cmp md,2
je _oth
mwrite "		"
mov edx,offset name2
call writestring
mwrite " = "
mov eax,score2
call writedec
call crlf

cmp score2,9
jg _ex2
cmp score1,9
jg _ex1
jmp _startup2

_oth:
mwrite "		"
mov edx,offset name5
call writestring
mwrite " = "
mov eax,score2
call writedec
call crlf
cmp score2,9
jg _ex2
cmp score1,9
jg _ex1
jmp _startup2


_ex2:
cmp md,2
je _exc2
mov edx,offset name2
call writestring
mwrite " , won the game!!"
call _restart
cmp rply,1 
jne _qu
jmp _again


_exc2:
mov edx,offset name5
call writestring
mwrite " , won the game!!"
call _restart
cmp rply,1 
jne _qu
jmp _again

_ex1:
mov edx,offset name1
call writestring
mwrite " , won the game!!"
call _restart
cmp rply,1 
jne _qu
jmp _again	

_qu:
exit
main ENDP


_restart PROC
call crlf
mwrite "Do you want to play again? (Y/N)"
call readchar
_h1:
cmp al,89
je _Y
cmp al,121
je _Y

cmp al,78
je _N
cmp al,110
je _N
call crlf
mwrite "You entered invalid character!"
call crlf
jmp _h1

_Y:
mov rply,1
mov score1,0
mov score2,0
mov score3,0
mov edi,0
mov ecx,36
_lp1:

mov actual[edi],0

 loop _lp1

jmp _quit
_N:
mov rply,0
call crlf
mwrite "Thanks for playing..."



_quit:
ret 
_restart ENDP
screen PROC

call clrscr

mwrite "Table is preparing..."
mov eax,500
call delay
call clrscr
mov esi,0
mov edi,0




		
mov ecx,7
mov al,32
call writechar
l5:		; harfler için

mov al,letter[esi]
call writechar
mov al,32
call writechar
inc esi
	loop l5

call crlf
call crlf
mov esi,temp_esi
mov temp_esi,0

mov count,sizeof arraych
mov ecx,6
mov edi,0
mov esi,0
l4:

mov temp,ecx
mov al,number[edi]
call writechar
mov al,32
call writechar
inc edi

mov ecx,6
mov temp_edi,edi
l3:
mov al,32
call writechar
cmp actual[esi],1
jne _keep
mov al,arraych[esi]
call writechar
jmp _after
_keep:
mov temp_edi,edi


mov al,32
call writechar
_after:
inc esi
	loop l3
	call crlf
	mov ecx,temp
call crlf
	loop l4


ret

screen ENDP

randarray PROC
mov ebx,0
mov edi,0

call randomize
_start:

mov eax,36
call RandomRange 
mov randval,eax
mov esi,randval

mov dl,arraych[esi]
mov cl,arraych[edi]


mov arraych[edi],dl
mov arraych[esi],cl

inc edi
inc ebx
cmp ebx,36
jne _start

 ret

randarray ENDP

randclient PROC

call randomize
mov eax,2
call RandomRange 
add eax,1

mov client,eax

ret
randclient ENDP

randcomp PROC

mwrite "Computer makes move.Please wait..."
call crlf
mov eax,500
call delay
_head:

call randomize
mov eax,6
call RandomRange 
mov cor1,eax
mov edi,eax
cmp actual[edi],1
je _head


_head2:
call randomize
mov eax,31
call RandomRange 

mov cor2,eax
mov edi,eax
cmp actual[edi],1
je _head2
cmp eax,cor1
je _head

mov edi,cor1
mov esi,cor2

mov actual[esi],1
mov actual[edi],1

ret
randcomp ENDP
END main