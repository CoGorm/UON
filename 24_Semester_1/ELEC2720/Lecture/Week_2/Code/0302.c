// 0302.c
#include <stdio.h>

union number {               
   int x;                    
   double y;                 
};

int main(void) {
   union number value; // define a union variable
   
   value.x = 100; // put an int into the union
   puts("Put 100 in the int member and print both members:");
   printf("int: %d\ndouble: %.2f\n\n", value.x, value.y);
   
   value.y = 100.0; // put a double into the same union
   puts("Put 100.0 in the double member and print both members:");
   printf("int: %d\ndouble: %.2f\n\n", value.x, value.y);
}
