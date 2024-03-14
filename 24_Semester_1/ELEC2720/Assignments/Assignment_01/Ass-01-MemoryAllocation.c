// Ass-01-MemoryAllocation.c

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h> // for malloc, free

int main(void) {
#define NUM_VALUES 100
  int16_t *aPtr; // Pointer to memory to be allocated
  int16_t *bPtr; // Pointer to memory to be allocated
  int16_t *cPtr; // Pointer to memory to be allocated

  printf("a) Allocate memory to aPtr and assign value:\n");
  aPtr = (int16_t *)malloc((size_t)(NUM_VALUES * sizeof(int16_t)));
  if (aPtr == NULL) {
    printf("   ERROR: Could not allocate memory");
    return 1;
  }
  *aPtr = 1;
  printf("   aPtr = %p\n", aPtr);
  printf("  *aPtr = %u\n", *aPtr);

  printf("b) Allocate memory to bPtr and assign value:\n");
  bPtr = (int16_t *)malloc((size_t)(NUM_VALUES * sizeof(int16_t)));
  if (bPtr == NULL) {
    printf("   ERROR: Could not allocate memory");
    return 1;
  }
  *bPtr = 2;
  printf("   aPtr = %p\n", aPtr);
  printf("  *aPtr = %u\n", *aPtr);
  printf("   bPtr = %p\n", bPtr);
  printf("  *bPtr = %u\n", *bPtr);

  printf("c) Free memory pointed to by aPtr:\n");
  free(aPtr);
  printf("   aPtr = %p\n", aPtr);
  printf("  *aPtr = %u\n", *aPtr);

  printf("d) Allocate memory to cPtr and assign value:\n");
  cPtr = (int16_t *)malloc((size_t)(NUM_VALUES * sizeof(int16_t)));
  if (cPtr == NULL) {
    printf("   ERROR: Could not allocate memory");
    return 1;
  }
  *cPtr = 3;
  printf("   aPtr = %p\n", aPtr);
  printf("  *aPtr = %u\n", *aPtr);
  printf("   bPtr = %p\n", bPtr);
  printf("  *bPtr = %u\n", *bPtr);
  printf("   cPtr = %p\n", cPtr);
  printf("  *cPtr = %u\n", *cPtr);

  free(bPtr);
  free(cPtr);

  return 0;
}
