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

finish_num EQU 10

.code

start:

main proc
  push 1
  push 1
  push 0
  call fibo
  
  add esp, 12 

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

fibo:
    ; first number: [esp + 12]
    ; secend number: [esp + 8]
    ; nth number: [esp + 4]
    
    mov eax, [esp + 12]
    mov ecx, [esp + 8]
    mov edx, [esp + 4]

    push ecx
    add ecx, eax
    push ecx

    inc edx
    push edx

    cmp edx, finish_num
    jae finish
    
    call fibo

    finish:
    add esp, 12
    ret


end start
