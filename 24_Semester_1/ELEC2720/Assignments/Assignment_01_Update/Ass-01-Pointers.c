// Ass-01-Pointers.c

#include <stdio.h>
#include <stdint.h>

int main ( void )
{
  int16_t a;    // Declare a int16_t
  int16_t *aPtr; // Declare a pointer to a int16_t (use *)

  printf ("a) Assigning a pointer:\n");
  a = 1234;
  aPtr = &a; // Assign to be the address of a (use &)
  printf ("   a = %d, *aPtr = %d, aPtr = %p, &a = %p\n", a, *aPtr, aPtr, &a);
  printf ("b) Dereferencing a pointer:\n");
  *aPtr = 5678; // Set value of a by dereferencing pointer to a (use *)
  printf ("   a = %d, *aPtr = %d, aPtr = %p, &a = %p\n", a, *aPtr, aPtr, &a);

  return 0;
}
