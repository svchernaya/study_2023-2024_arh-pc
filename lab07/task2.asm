%include 'in_out.asm'
section .data

msg1 DB 'Введите x: ',0h
msg2 DB "Введите a: ",0h
otv: DB 'F(x)=',0h

section .bss
x: RESB 10
a: RESB 10
res: RESB 10

section .text
global _start
_start:

mov eax, msg1
call sprint
mov ecx,x
mov edx,10
call sread
mov eax,x
call atoi
mov [x],eax

mov eax,msg2
call sprint
mov ecx,a
mov edx,10
call sread
mov eax,a
call atoi
mov [a],eax

mov ecx, [a]
cmp ecx, 0
je x_is_0
mov eax, [x]
mov ebx,2
mul  ebx
add  eax, ecx
jmp calc_res
x_is_0:
mov ebx,2
mov eax, [x]
mul ebx
inc eax
calc_res:
mov [res],eax
fin:
mov eax,otv
call sprint
mov eax,[res]
call iprintLF
call quit
