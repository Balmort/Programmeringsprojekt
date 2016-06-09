#include <eZ8.h>             // special encore constants, macros and flash routines
#include <sio.h>             // special encore serial i/o routines
#include <stdio.h>

#ifndef ANSI_H
#define ANSI_H

void bgcolor(int background);
void fgcolor(int foreground);
void color(int foreground, int background);
void resetbgcolor();
void clreol();
void clrscr();
void gotoxy(int x, int y);
void underline(char on);
void blink(char on);
void reverse(char on);
void window(int x1, int y1, int x2, int y2, char *title, int style);



#endif	// ANSI_H
