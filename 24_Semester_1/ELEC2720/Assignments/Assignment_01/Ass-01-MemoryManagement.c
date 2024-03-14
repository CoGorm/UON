// Ass-01-MemoryManagement.c

#include <stdint.h>
#include <stdio.h>

int16_t m; // Local to this file

static void TestStatic(void); // Function prototype

int main(void) {
  int16_t a; // Local to function

  printf("a) Module and local variables:\n");
  printf("   &m = %p\n", &m);
  printf("   &a = %p\n", &a);

  printf("b) Scope:\n");
  {
    int16_t m; // Module level
    int16_t a; // Local to function

    printf("   &m = %p\n", &m);
    printf("   &a = %p\n", &a);
  }

  printf("c) Static variable:\n");
  TestStatic();
  TestStatic();
  TestStatic();

  return 0;
}

static void TestStatic(void) // This function only visible in this file
{
  int16_t s = 0;

  if (s == 0) {
    printf("   &s = %p\n", &s);
  }
  printf("   s = %d\n", s);
  s++;
}
