#include "ansi.h"
//#include <eZ8.h>             // special encore constants, macros and flash routines
//#include <sio.h>             // special encore serial i/o routines
//#include <stdio.h>

#define ESC 0x1B

void fgcolor(int foreground) {
/*  Value      foreground     Value     foreground
    ------------------------------------------------
      0        Black            8       Dark Gray
      1        Red              9       Light Red
      2        Green           10       Light Green
      3        Brown           11       Yellow
      4        Blue            12       Light Blue
      5        Purple          13       Light Purple
      6        Cyan            14       Light Cyan
      7        Light Gray      15       White
*/
  int type = 22;             // normal text
	if (foreground > 7) {
	  type = 1;                // bold text
		foreground -= 8;
	}
  printf("%c[%d;%dm", ESC, type, foreground+30);
}

void bgcolor(int background) {
/* IMPORTANT:   When you first use this function you cannot get back to true white background in HyperTerminal.
   Why is that? Because ANSI does not support true white background (ANSI white is gray to most human eyes).
                The designers of HyperTerminal, however, preferred black text on white background, which is why
                the colors are initially like that, but when the background color is first changed there is no
 	              way comming back.
   Hint:        Use resetbgcolor(); clrscr(); to force HyperTerminal into gray text on black background.

    Value      Color      
    ------------------
      0        Black
      1        Red
      2        Green
      3        Brown
      4        Blue
      5        Purple
      6        Cyan
      7        Gray
*/
  printf("%c[%dm", ESC, background+40);
}

void color(int foreground, int background) {
// combination of fgcolor() and bgcolor() - uses less bandwidth
  int type = 22;             // normal text
	if (foreground > 7) {
	  type = 1;                // bold text
		foreground -= 8;
	}
  printf("%c[%d;%d;%dm", ESC, type, foreground+30, background+40);
}

void resetbgcolor() {
// gray on black text, no underline, no blink, no reverse
  printf("%c[m", ESC);  
}

void clreol() {
//Clears rest of line
	printf("%c[K", ESC);
}

void clrscr() {
//Clears the screen
	printf("%c[2J", ESC);
}

void gotoxy(int x, int y) {
	printf("%c[%d;%df", ESC, y, x);
}

void underline(char on) {
	if (on == 'y'){
		printf("%c[4m", ESC);
	} else {
		printf("%c[24m", ESC);
	}
}

void blink(char on) {
	if(on == 'y'){
		printf("%c[5m", ESC);
	} else {
		printf("%c[25m", ESC);
	}
}

void reverse(char on) {
	if(on == 'y'){
		printf("%c[7m", ESC);
	} else {
		printf("%c[27m", ESC);
	}
}

void window(int x1, int y1, int x2, int y2, char *title, int style){
	int i;
	int j;

	int hor, ver, upleft, upright, downleft, downright, start, end;
	gotoxy(x1, y1);

//Style-switcher
	switch(style){
		case 1:
			hor = 205;
			ver = 186;
			upleft = 201;
			upright = 187;
			downleft = 200;
			downright = 188;
			start = 185;
			end = 204;
			break;
		case 2:
			hor = 196;
			ver = 179;
			upleft = 218;
			upright = 191;
			downleft = 192;
			downright = 217;
			start = 180;
			end = 195;
			break;
		default:
			hor = 205;
			ver = 186;
			upleft = 201;
			upright = 187;
			downleft = 200;
			downright = 188;
			start = 185;
			end = 204;
	}
	
//TOP
	printf("%c%c", upleft, start);
	//Print top line of window
	for(i = x1+2; i < x2-1; i++){
		printf("%c", 32);
	}
	//Top end
	printf("%c%c\n", end, upright);
	

	
//MID
	//Midt-section
	for(j = y1+1; j < y2-1; j++){
		printf("%c", ver);
		for(i = x1; i < x2-1; i++){
			printf("%c", 32);
		}
		printf("%c\n", ver);
	}
	
//BOT
	//Bot bar
	printf("%c", downleft);
	for(i = x1; i < x2-1; i++){
		printf("%c", hor);
	}
	printf("%c\n", downright);

//Window title
	j = 0;
	gotoxy(x1+3,y1);
	while(title[j] != '\0' && j < x2-6 ){
		printf("%c", title[j]);
		j++;
	}
}



