// 0117.c
#include <stdio.h>

int main(void) {
   for (int x = 1; x <= 10; ++x) {
      if (x == 5) {
         continue; // skip remaining code in loop body
      }

      printf("%d ", x);
   }
}
