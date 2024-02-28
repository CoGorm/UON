// 0112.c
#include <stdio.h>

int main(void) {
   for (int counter = 0; counter <= 9; ++counter) {
      printf("Loop: %d\n", counter);
      counter = counter + 2;
      printf("Increase: %d \n", counter);
   }
}
