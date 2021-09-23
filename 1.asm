.386
.model flat,stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\user32.inc

includelib \masm32\lib\user32.lib

.data
BUFFER_LENGTH EQU 1024
szMessageBoxFormat BYTE "The result is %d", 0
szMessageBoxText BYTE 0 dup(BUFFER_LENGTH)

.code

start:


main proc
  mov ecx, 2
  mov edx, 4
  call pow

  push eax
  call display_number_in_message_box
  ret
main endp

display_number_in_message_box proc
  ;Create a string representation of the number
  
  mov eax, [esp + 4]
  invoke wsprintf, ADDR szMessageBoxText, ADDR szMessageBoxFormat, eax

  ;Display that string in a message box
  invoke MessageBoxA, NULL, ADDR szMessageBoxText, NULL, MB_OK

  
  ret 4
display_number_in_message_box endp


pow:
    ; ecx=the num to multiple edx=the times to multiple
    xchg edx, ecx ; swap
    mov eax, 1 ; the return value

    test ecx, ecx
    js end_pow
    
    mul_loop:
        ; pusha
        ; push edx
        ; call display_number_in_message_box
        ; popa
        push edx ; reset the fucking edx!
        mul edx         ; edx:eax = eax * edx
        pop edx
        ;push eax
        ;all display_number_in_message_box
        loop mul_loop 
    end_pow:
    ret


end start
