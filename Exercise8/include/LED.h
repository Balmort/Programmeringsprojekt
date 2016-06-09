#include <eZ8.h>             // special encore constants, macros and flash routines
#include <sio.h>             // special encore serial i/o routines
#include <stdio.h>
#include "charset.h"

#ifndef LED_H
#define LED_H

extern char videoB[5][6]; //Global
extern volatile unsigned long clock;

void LED_init();
void loadBuffer(char data_inp, char display);
void LEDUpdate(char columm, char display);
void LEDleft();
void Buffer(char data[]);

#endif	// LED_H
