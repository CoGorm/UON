// 0205.c
#include <stdio.h>
#define RESPONSES_SIZE 20
#define FREQUENCY_SIZE 6

int main(void) {
   int responses[RESPONSES_SIZE] = 
      {1, 2, 5, 4, 3, 5, 2, 1, 3, 1, 4, 3, 3, 3, 2, 3, 3, 2, 2, 5};

   int frequency[FREQUENCY_SIZE] = {0};
   
   for (size_t answer = 0; answer < RESPONSES_SIZE; ++answer) {
      ++frequency[responses[answer]];
   } 

   // display results
   printf("%s%12s\n", "Rating", "Frequency");
   for (size_t rating = 1; rating < FREQUENCY_SIZE; ++rating) {
      printf("%6zu%12d\n", rating, frequency[rating]);
   } 
} 
