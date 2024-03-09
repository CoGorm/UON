// 0213.c
#include <stdio.h>
#define SIZE 20

size_t getSize(const float *ptr);

int main(void){
   float array[SIZE]; // create array
   printf("Number of bytes in the array is %zu\n", sizeof(array));
   printf("Number of bytes returned by getSize is %zu\n", getSize(array));
} 

size_t getSize(const float *ptr) {
   return sizeof(ptr);
} 
