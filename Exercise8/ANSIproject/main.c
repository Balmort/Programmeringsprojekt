#include <eZ8.h>             // special encore constants, macros and flash routines
#include <sio.h>             // special encore serial i/o routines
#include <stdio.h>
#include "ansi.h"
#include "LUT.h"
#include "func.h"
#include "charset.h"
#include "LED.h"

char videoB[5][6];

volatile unsigned long clock;

#pragma interrupt
void timer0int(){
	clock++;
}
/*
void LED_init(){
	DI();
	T0CTL = 0x99;	// Disable timer, set cont. mode and prescale: 00-01 1-001
	T0RH = 0x04;	// Sets reload high register
	T0RL = 0x80;	// Sets reload low register
	SET_VECTOR(TIMER0, timer0int);
	IRQ0ENH &= ~0x10;	//Enable timer0 interrupt, set low priority
	IRQ0ENL |= 0x20;	//
	EI();
	PEDD = 0;
	PGDD = 0;
}

void loadBuffer( char data_inp, char display){
	char i;
	for(i = 0; i < 5; i++){
 		videoB[display][i] = character_data[data_inp - ' '][i];
	}
	videoB[display][i] = 0x00;
}

void LEDUpdate (char columm, char display){
	PEOUT ^= (0x01<<columm);
	PGOUT |= videoB[display][4-columm];	
	switch(display){
    	case 0:
			PEOUT |= (1<<7);	
			break;
		case 1:
			PGOUT |= (1<<7);
			break;
		case 2:
			PEOUT |=(1<<5);
			break;
		case 3:
			PEOUT |=(1<<6);
			break;
		default:
			break;
	}
	PEOUT = 0x1F;
	PGOUT = 0;
}

void LEDleft(){
	char i;
	char *buffer1D = (char*)videoB;
	for (i = 1; i<30; i++){
		buffer1D[i-1] = buffer1D[i];
	}
}

void Buffer(char data[]){
	char index;
	for( index = 0; index < 5 && data[index]!= '\0'; index++){
		loadBuffer( data[index], index);
	}
}
*/
void main() {
	char columm = 0, display = 0, i,  n, index, count = 0, shift = 1;
	double running = 0;
	char data[] = "FISHGUTS  ";
	init_uart(_UART0, _DEFFREQ, _DEFBAUD);
// initialis LED and clock
	LED_init();
	//finde string length
	Buffer(data);
	n = sizeof(data)/sizeof(char)-1;
	// Mainloop
	while(1){
		if (clock >=2){
			shift++;
			//reset the display
			if (columm == 0){
				PEOUT |= 0xE0;
				PGOUT |= 0x80;
				PEOUT = 0x1F;
				PGOUT = 0;
			}
			LEDUpdate(columm, display);
			//change display
			if(columm == 4){
				display = (display + 1) % 4;
				columm = -1;
			}
			columm++;
			clock=0;
		}
		// shift left
		if (shift  >= 90 ) {
			LEDleft();
			count++;
			shift = 0;
			//load new letter to "screen" 5
			if (count == 6) {
				loadBuffer( data[index], 4);
				index = (index + 1) % n;
				count = 0;
			}
		}
	}
}

