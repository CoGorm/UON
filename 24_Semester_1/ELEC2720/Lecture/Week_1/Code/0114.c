// 0114.c
#include <stdio.h>

int main(void) {
   int aCount = 0;
   int bCount = 0; 
   int cCount = 0; 
   int dCount = 0; 
   int fCount = 0; 

   puts("Enter the letter grades.");
   puts("EOF character to end.");
   int grade = 0; // one grade 

   while ((grade = getchar()) != EOF) {

      switch (grade) { 
         case 'A': 
         case 'a': 
            ++aCount; 
            break; 
         case 'B': 
         case 'b': 
            ++bCount; 
            break; 
         case 'C': 
         case 'c': 
            ++cCount; 
            break;
         case 'D': 
         case 'd': 
            ++dCount; 
            break;
         case 'F': 
         case 'f': 
            ++fCount; 
            break; 
         case '\n': // ignore newlines,
         case '\t': // tabs,
         case ' ': // and spaces in input
            break; 
         default: // catch all other characters
            puts("Incorrect grade entered."); 
            puts(" Enter a new grade.");
            break; // optional
      } // end switch 
   } // end while

   // output summary of results
   puts("\nTotals for each letter grade are:");
   printf("A: %d\n", aCount);
   printf("B: %d\n", bCount); 
   printf("C: %d\n", cCount); 
   printf("D: %d\n", dCount); 
   printf("F: %d\n", fCount); 
}
