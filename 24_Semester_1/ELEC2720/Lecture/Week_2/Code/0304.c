// 0304.c
#include <stdio.h>

// prototype
void displayBits(unsigned int value); 
 
int main(void) {
   unsigned int x = 0; // variable to hold user input

   printf("%s", "Enter a nonnegative int: ");
   scanf("%u", &x);

   printf("Number entered in decimal: %d\n", x);
   printf("Number entered in hexadecimal: %x\n", x);
   printf("Bits in memory: ");
   displayBits(x);
}

// display bits of an unsigned int value
void displayBits(unsigned int value) {
   // define displayMask and left shift 31 bits
   unsigned int displayMask = 1 << 31; 

   // loop through bits 
   for (unsigned int c = 1; c <= 32; ++c) { 
      putchar(value & displayMask ? '1' : '0');
      value <<= 1; // shift value left by 1      

      // output space after 8 bits
      if (c % 8 == 0) { 
         putchar(' ');
      }
   }

   putchar('\n');
}
