// Ass-01-Pointers.c

#include <stdint.h>
#include <stdio.h>

int main(void) {
  int8_t a;     // Declare a int16_t
  int8_t *aPtr; // Declare a pointer to a int16_t (use *)

  // printf("a) Assigning a pointer:\n");
  // a = 1234;
  // aPtr = &a; // Assign to be the address of a (use &)
  // printf("   a = %d, *aPtr = %d, aPtr = %p, &a = %p\n", a, *aPtr, aPtr, &a);
  // printf("b) Dereferencing a pointer:\n");
  //*aPtr = 5678; // Set value of a by dereferencing pointer to a (use *)
  // printf("   a = %d, *aPtr = %d, aPtr = %p, &a = %p\n", a, *aPtr, aPtr, &a);

  *aPtr = 0x0103; // Set value of a by dereferencing pointer to a (use *)
  printf("   a = %d, *aPtr = %d, aPtr = %p, &a = %p\n", a, *(int8_t *)*aPtr,
         aPtr, &a);
  return 0;
}
