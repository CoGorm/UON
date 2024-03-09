// 0210.c
#include <stdio.h>

int main(void) {
   int a = 7;
   int *aPtr = &a; // set aPtr to the address of a

   // %p outputs a memory location as a hexadecimal integer
   printf("Address of a is %p\nValue of aPtr is %p\n\n", &a, aPtr);
   printf("Value of a is %d\nValue of *aPtr is %d\n\n", a, *aPtr);
   printf("Showing that * and & are complements of each other\n");
   printf("&*aPtr = %p\n*&aPtr = %p\n", &*aPtr, *&aPtr);
} 
