// 0211.c
#include <stdio.h>

int cubeByValue(int n); // prototype

int main(void) {
   int number = 5; // initialize number

   printf("The original value of number is %d", number);
   number = cubeByValue(number);
   printf("\nThe new value of number is %d\n", number);
} 

int cubeByValue(int n) {                                       
   return n * n * n;
}                                                              
