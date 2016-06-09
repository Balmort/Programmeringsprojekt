#include "LUT.h" 
#include <sio.h>             // special encore serial i/o routines

//#include <stdio.h>

#define FIX14_SHIFT 14
#define FIX14_MULT(a,b) ( (a)*(b) >> FIX14_SHIFT)

#ifndef FUNC_H
#define FUNC_H


struct TVector{
	long x,y;
};

void printFix(long i);
long expand(long i);
long conv_sin(int phi);
void initVector(struct TVector *v);
void rotate(struct TVector *v, int phi);




#endif	// FUNC_H
