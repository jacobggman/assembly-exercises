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
  mov eax, 3
  push eax
  call display_number_in_message_box

  mov ebx, 999
  push ebx
  call display_number_in_message_box

  add eax, ebx
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

end start
