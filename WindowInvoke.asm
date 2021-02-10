;"Assemble and Link"
.486
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\macros\macros.asm
include \masm32\include\masm32.inc
include \masm32\include\gdi32.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\gdi32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.data
    s1 byte "Hello, World!",10,0
    s2 byte "MASM32 on WinPE",0

.code
    _main proc
        push ebp
        mov ebp, esp
        invoke MessageBox, \
            NULL, \
            addr s1, \
            addr s2, \
            MB_OK
        mov esp, ebp
        pop ebp
        ret
    _main endp
    start:
        call _main
        exit
    end start
