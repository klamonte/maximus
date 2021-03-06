; SHARE.ASM - function call to determine whether or not SHARE.EXE
; is loaded (DOS only)

IFNDEF OS_2

IFNDEF __FLAT__
        .model large, pascal
        .code

        public SHARELOADED

SHARELOADED proc
        inc     bp
        push    bp
        mov     bp,sp

        mov     ax,1000h                ; Check for SHARE.EXE installation
        int     2fh                     ; DOS multiplexer interrupt
        cmp     al,0ffh                 ; ffh = SHARE loaded
        je      GetOut

        xor     ax,ax
GetOut:
        pop     bp
        dec     bp
        ret

SHARELOADED endp

ELSE            ; __FLAT__
        .386p
        .model small, pascal
        .code
        public SHARELOADED

SHARELOADED proc
        inc     bp
        push    bp
        mov     bp,sp

        mov     eax,1000h               ; Check for SHARE.EXE installation
        int     2fh                     ; DOS multiplexer interrupt
        cmp     al,0ffh                 ; ffh = SHARE loaded
        je      GetOut

        xor     eax,eax
GetOut:
        pop     bp
        dec     bp
        ret

SHARELOADED endp

ENDIF ; __FLAT__

ENDIF ; !OS_2

end


