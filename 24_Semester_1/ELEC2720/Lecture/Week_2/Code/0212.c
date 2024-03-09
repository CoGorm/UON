// 0212.c

#include <stdio.h>

void cubeByReference(int *nPtr); // prototype

int main(void) {
   int number = 5;
 
   printf("The original value of number is %d", number);
   cubeByReference(&number);
   printf("\nThe new value of number is %d\n", number);
} 

void cubeByReference(int *nPtr) {                           
   *nPtr = *nPtr * *nPtr * *nPtr;           
}
