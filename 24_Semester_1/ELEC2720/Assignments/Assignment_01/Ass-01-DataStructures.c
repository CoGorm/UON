// Ass-01-DataStructures.c

#include <stdint.h>
#include <stdio.h>

int main(void) {
  struct myFirstStruct {
    char c;
    int i;
    float f;
  } a = {'a', 1, 2.34};

  printf("a) Elements in a (initialised at declaration):\n");
  printf("   a.c = '%c'\n", a.c);
  printf("   a.i = '%d'\n", a.i);
  printf("   a.f = '%f'\n", a.f);
  //
  printf("b) Elements in a (modified values):\n");
  a.c = 'b';
  a.i = 2;
  a.f = 5.67;
  printf("   a.c = '%c'\n", a.c);
  printf("   a.i = '%d'\n", a.i);
  printf("   a.f = '%f'\n", a.f);

  struct myFirstStruct *structPtr = &a;

  printf("c) Accessing elements using a pointer:\n");
  printf("   structPtr->c = '%c'\n", structPtr->c);
  printf("   structPtr->i = '%d'\n", structPtr->i);
  printf("   structPtr->i = '%d'\n", (*structPtr).i);
  printf("   structPtr->f = '%f'\n", structPtr->f);

  return 0;
}
