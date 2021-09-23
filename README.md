# assembly-exercises

## Setup
Install masm32 in masm32.com 

Place in C:\asm the asm files

run x.asm file:
```
C:\masm32\bin\ml.exe /c /coff /Cp x.asm 

C:\masm32\bin\link.exe /SUBSYSTEM:WINDOWS /LIBPATH:C:\masm32\lib x.obj
```


## Files

- 0 - sum of first 100 numbers (in O(1) and without div!)
- 1 - power exponent function in fastcall
- 2 - function cdeel that find the N-th fibonacci with recursion*
- 3 - function stdcall that find the N-th fibonacci without recursion*
- 4 - first 3 digits that divided without residue

\*can be in O(1) with Binet 
