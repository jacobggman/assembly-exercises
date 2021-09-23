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

nums EQU 100

.code

start:

main proc
  ;formala n∗(n+1)/2
  mov  eax, nums     
  mov  ecx, nums + 1    
  mul  ecx        ; eax = eax * ecx   ; actually edx:eax = ax * cx
  
  sar eax, 1

  ; adding:
  ;   add eax, ecx
  ;   loop adding

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
