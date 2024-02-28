// 0201.c
#include <stdio.h> 

int square(int number); // function prototype 

int main(void) {
   // loop 10 times and calculate and output square of x each time
   for (int x = 1; x <= 10; ++x) {
      printf("%d  ", square(x)); // function call
   } 
   puts("");
} 

int square(int number) { // number is a copy of the function's argument 
   return number * number; // returns square of number as an int        
}                                                                       
