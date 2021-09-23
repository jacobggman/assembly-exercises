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
    push 1
    call fibo
    push eax
    call display_number_in_message_box

    push 2
    call fibo
    push eax
    call display_number_in_message_box 

    push 3
    call fibo
    push eax
    call display_number_in_message_box

    push 5
    call fibo
    push eax
    call display_number_in_message_box

    push 50
    call fibo
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
    ; nth number: [esp + 4]
    
    mov ecx, [esp + 4]
    mov eax, 0 ; a
    mov edx, 1 ; b

    adding:
        push edx
        add edx, eax 
        pop eax 
    loop adding
    
    ret 4

end start

