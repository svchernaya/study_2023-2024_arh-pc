%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0
SECTION .text
global _start
_start:
pop ecx 
pop edx 
sub ecx,1 
mov esi, 0
next:
cmp ecx,0h 
jz _end 
pop eax 
call atoi 
call miso
loop next 
_end:
mov eax, msg 
call sprint
mov eax, esi 
call iprintLF 
call quit
miso:
dec eax
mov ebx,2 
mul ebx
add esi,eax
ret
