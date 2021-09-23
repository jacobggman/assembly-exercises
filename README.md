# assembly-exercises

## Setup
Install masm32 in masm32.com 

Place in C:\asm the asm files

run x.asm file:
```
C:\masm32\bin\ml.exe /c /coff /Cp x.asm 

C:\masm32\bin\link.exe /SUBSYSTEM:WINDOWS /LIBPATH:C:\masm32\lib x.obj
```
