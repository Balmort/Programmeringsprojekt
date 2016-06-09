#
# ZDS II Make File - Excercise5, Debug
#

CC = @C:\PROGRA~2\ZiLOG\ZDSII_~1.3\bin\eZ8cc
ASM = @C:\PROGRA~2\ZiLOG\ZDSII_~1.3\bin\eZ8asm
LINK = @C:\PROGRA~2\ZiLOG\ZDSII_~1.3\bin\eZ8link
LIB = @C:\PROGRA~2\ZiLOG\ZDSII_~1.3\bin\eZ8lib

# compiler options
#   -alias -asm -bitfieldsize:32 -charsize:8 -const:RAM -debug
#   -define:_Z8F6403 -define:_Z8ENCORE_640_FAMILY
#   -define:_Z8ENCORE_F640X -define:_MODEL_LARGE -doublesize:32
#   -NOexpmac -floatsize:32 -NOfplib -genprintf -NOglobalcopy
#   -NOglobalcse -NOglobalfold -intrinsic -intsize:16 -intsrc -NOjmpopt
#   -NOkeepasm -NOkeeplst -NOlist -NOlistinc -localcopy -localcse
#   -localfold -longsize:32 -NOloopopt -maxerrs:50 -model:L -NOoptlink
#   -optsize -peephole -NOpromote -quiet -regvar -revaa -NOsdiopt
#   -shortsize:16
#   -stdinc:"C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std;C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog;C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\Z8Encore_F640X"
#   -strict -usrinc:"G:\Dropbox\Programmeringsprojekt\Exercise7\include"
#   -NOwatch -cpu:Z8F6403
#   -asmsw:" -cpu:Z8F6403 -define:_Z8F6403=1 -define:_Z8ENCORE_640_FAMILY=1 -define:_Z8ENCORE_F640X=1 -define:_MODEL_LARGE=1 -include:C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std;C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog;C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\Z8Encore_F640X -revaa"
CFLAGS = -sw:G:\Dropbox\Programmeringsprojekt\Exercise8\Output\Excercise5_Debug.ccsw
# assembler options
#   -debug -define:_Z8F6403=1 -define:_Z8ENCORE_640_FAMILY=1
#   -define:_Z8ENCORE_F640X=1 -define:_MODEL_LARGE=1 -genobj -NOigcase
#   -include:"C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std;C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog;C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\Z8Encore_F640X"
#   -list -NOlistmac -name -pagelen:56 -pagewidth:80 -quiet -sdiopt
#   -warn -NOzmasm -revaa -cpu:Z8F6403
AFLAGS = -sw:G:\Dropbox\Programmeringsprojekt\Exercise8\Output\Excercise5_Debug.asmsw

OUTDIR = G:\Dropbox\Programmeringsprojekt\Exercise8\Output\

Debug: Excercise5

deltarget: 
	@if exist G:\Dropbox\Programmeringsprojekt\Exercise8\Excercise5.lod  \
            del G:\Dropbox\Programmeringsprojekt\Exercise8\Excercise5.lod

clean: 
	@if exist G:\Dropbox\Programmeringsprojekt\Exercise8\Excercise5.lod  \
            del G:\Dropbox\Programmeringsprojekt\Exercise8\Excercise5.lod
	@if exist G:\Dropbox\Programmeringsprojekt\Exercise8\Output\zsldevinit.obj  \
            del G:\Dropbox\Programmeringsprojekt\Exercise8\Output\zsldevinit.obj
	@if exist G:\Dropbox\Programmeringsprojekt\Exercise8\Output\main.obj  \
            del G:\Dropbox\Programmeringsprojekt\Exercise8\Output\main.obj
	@if exist G:\Dropbox\Programmeringsprojekt\Exercise8\Output\ansi.obj  \
            del G:\Dropbox\Programmeringsprojekt\Exercise8\Output\ansi.obj
	@if exist G:\Dropbox\Programmeringsprojekt\Exercise8\Output\LUT.obj  \
            del G:\Dropbox\Programmeringsprojekt\Exercise8\Output\LUT.obj
	@if exist G:\Dropbox\Programmeringsprojekt\Exercise8\Output\func.obj  \
            del G:\Dropbox\Programmeringsprojekt\Exercise8\Output\func.obj
	@if exist G:\Dropbox\Programmeringsprojekt\Exercise8\Output\LED.obj  \
            del G:\Dropbox\Programmeringsprojekt\Exercise8\Output\LED.obj

rebuildall: clean Debug

relink: deltarget Debug

LIBS = 

OBJS =  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\Output\zsldevinit.obj  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\Output\main.obj  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\Output\ansi.obj  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\Output\LUT.obj  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\Output\func.obj  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\Output\LED.obj

Excercise5: $(OBJS)
	 $(LINK)  @G:\Dropbox\Programmeringsprojekt\Exercise8\Output\Excercise5_Debug.linkcmd

G:\Dropbox\Programmeringsprojekt\Exercise8\Output\zsldevinit.obj :  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\zsldevinit.asm  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\ez8dev.inc  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\gpio.inc
	 $(ASM)  $(AFLAGS) G:\Dropbox\Programmeringsprojekt\Exercise8\zsldevinit.asm

G:\Dropbox\Programmeringsprojekt\Exercise8\Output\main.obj :  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\ANSIproject\main.c  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\FORMAT.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDARG.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDIO.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\FORMAT.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDARG.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDIO.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\defines.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\dmadefs.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\ez8.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\gpio.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\SIO.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\uart.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\uartdefs.h  \
            G:\Dropbox\PROGRA~1\EX3044~1\include\LUT.h  \
            G:\Dropbox\PROGRA~1\EX3044~1\include\ansi.h  \
            G:\Dropbox\PROGRA~1\EX3044~1\include\charset.h  \
            G:\Dropbox\PROGRA~1\EX3044~1\include\func.h
	 $(CC)  $(CFLAGS) G:\Dropbox\Programmeringsprojekt\Exercise8\ANSIproject\main.c

G:\Dropbox\Programmeringsprojekt\Exercise8\Output\ansi.obj :  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\include\src\ansi.c  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\FORMAT.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDARG.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDIO.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\FORMAT.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDARG.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDIO.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\defines.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\dmadefs.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\ez8.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\gpio.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\SIO.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\uart.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\uartdefs.h  \
            G:\Dropbox\PROGRA~1\EX3044~1\include\ansi.h
	 $(CC)  $(CFLAGS) G:\Dropbox\Programmeringsprojekt\Exercise8\include\src\ansi.c

G:\Dropbox\Programmeringsprojekt\Exercise8\Output\LUT.obj :  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\include\src\LUT.c  \
            G:\Dropbox\PROGRA~1\EX3044~1\include\LUT.h
	 $(CC)  $(CFLAGS) G:\Dropbox\Programmeringsprojekt\Exercise8\include\src\LUT.c

G:\Dropbox\Programmeringsprojekt\Exercise8\Output\func.obj :  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\include\src\func.c  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\FORMAT.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDARG.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDIO.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\FORMAT.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\std\STDARG.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\defines.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\SIO.H  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\uart.h  \
            C:\PROGRA~2\ZiLOG\ZDSII_~1.3\include\zilog\uartdefs.h  \
            G:\Dropbox\PROGRA~1\EX3044~1\include\LUT.h  \
            G:\Dropbox\PROGRA~1\EX3044~1\include\func.h
	 $(CC)  $(CFLAGS) G:\Dropbox\Programmeringsprojekt\Exercise8\include\src\func.c

G:\Dropbox\Programmeringsprojekt\Exercise8\Output\LED.obj :  \
            G:\Dropbox\Programmeringsprojekt\Exercise8\include\src\LED.c
	 $(CC)  $(CFLAGS) G:\Dropbox\Programmeringsprojekt\Exercise8\include\src\LED.c

