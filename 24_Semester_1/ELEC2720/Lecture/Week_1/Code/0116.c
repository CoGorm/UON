// 0116.c
#include <stdio.h>

int main(void) {
   int x = 1; // declared here so it can be used after loop

   for (; x <= 10; ++x) {
      if (x == 5) {
         break; // break loop only if x is 5
      }
      printf("%d ", x);
   }

   printf("\nBroke out of loop at x == %d\n", x);
}
