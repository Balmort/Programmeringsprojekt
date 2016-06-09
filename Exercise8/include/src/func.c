#include "func.h"

void printFix(long i) {
//prints a signed 16.16 fixed point number
	if ((i & 0x80000000) != 0) {
		printf("-");
		i = ~i+1;
	}
	printf("%ld.%04ld", i >> 16, 10000 * (unsigned long) (i & 0xffff) >> 16); // Max 4 digits
}

long expand(long i) {
	//converts an 18.14 to a 16.16
	return i << 2;
}

long conv_sin(int phi) {
	long i;
  	i = (phi/360)*512;
	return i;
}



void initVector(struct TVector *v) {
	(*v).x = 10;
	(*v).y = 20;
} 

void rotate(struct TVector *v, int phi) {
	long dx;
	dx = (*v).x*getcos(phi) - (*v).y*getsin(phi);
	(*v).y = (*v).x*getsin(phi) + (*v).y*getcos(phi);
	(*v).x = dx;
}