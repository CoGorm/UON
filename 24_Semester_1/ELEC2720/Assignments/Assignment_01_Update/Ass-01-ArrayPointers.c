// Ass-01-ArrayPointers.c

#include <stdint.h>
#include <stdio.h>

int main(void) {
  int16_t i, j, k;  // Declare three int16_t variables
  int16_t *aPtr[3]; // Declare an array of three pointers to int16_t

  int8_t x;
  int16_t y;
  float z;
  void *bPtr[3]; // Declare an array of three void pointers;

  printf("a) Indexing array elements:\n");
  i = 12;
  j = 34;
  k = 56;
  aPtr[0] = &i;
  aPtr[1] = &j;
  aPtr[2] = &k;
  printf("   aPtr[0] = %p, aPtr[1] = %p, aPtr[2] = %p\n", aPtr[0], aPtr[1],
         aPtr[2]);
  printf("   *aPtr[0] = %d, *aPtr[1] = %d, *aPtr[2] = %d\n", *aPtr[0], *aPtr[1],
         *aPtr[2]);

  printf("b) Pointers to different data types:\n");
  x = 11;
  y = 22;
  z = 3.3;
  bPtr[0] = &x;
  bPtr[1] = &y;
  bPtr[2] = &z;
  printf("   bPtr[0] = %p,\n   bPtr[1] = %p,\n   bPtr[2] = %p\n", bPtr[0],
         bPtr[1], bPtr[2]);
  printf("   *(int8_t *)bPtr[0] = %d,\n"
         "   *(int16_t *)bPtr[1] = %d,\n   *(float *)bPtr[2] = %f\n",
         *(int8_t *)bPtr[0], *(int16_t *)bPtr[1], *(float *)bPtr[2]);
  printf("   &(*(int8_t *)bPtr[0]) = %p,\n"
         "   &(*(int16_t *)bPtr[1]) = %p,\n   &(*(float *)bPtr[2]) = %p\n",
         &(*(int8_t *)bPtr[0]), &(*(int16_t *)bPtr[1]), &(*(float *)bPtr[2]));

  return 0;
}
