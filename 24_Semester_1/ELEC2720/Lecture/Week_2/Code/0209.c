// 0209.c
#include <stdio.h>

void printArray(int a[][3]);

int main(void) {
   int array[2][3] = {{1, 2, 3}, {4}};
   puts("Values in array by row are:");
   printArray(array);
} 

void printArray(int a[][3]) {
   // loop through rows                                    
   for (size_t i = 0; i <= 1; ++i) {                        
      // output column values                              
      for (size_t j = 0; j <= 2; ++j) {                      
         printf("%d ", a[i][j]);                        
      }                                    
                                                              
      printf("\n"); // new line        
   }                                       
} 
