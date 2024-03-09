// 0219a.c
#include <stdio.h> 
#include "../0219.h"
int main(void) {
   for (int x = 1; x <= 10; ++x) {
      printf("%d  ", square(x)); // function call
   } 
   puts("");
} 
