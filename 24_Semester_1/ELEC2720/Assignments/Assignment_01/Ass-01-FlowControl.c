// Ass-01-FlowControl.c

#include <stdint.h>
#include <stdio.h>

int main(void) {
  int16_t a = 1;
  int16_t i;

  printf("a) Use of the if statement:\n");
  printf("   a = %d\n", a);
  printf("   ");
  if (a == 1) {
    printf("a is 1\n");
  } else if (a == 2) {
    printf("a is 2\n");
  } else {
    printf("a not 1 or 2\n");
  }

  printf("b) Use of the switch statement:\n");
  printf("   a = %d\n", a);
  printf("   ");
  switch (a) {
  case 1:
    printf("a is 1\n");
    break;
  case 2:
    printf("a is 2\n");
    break;
  default:
    printf("a not 1 or 2\n");
    break;
  }

  printf("c) Use of for loop:\n");
  for (i = 0; i < 4; i++) {
    printf("   i = %d\n", i);
  }
  printf("   i = %d (after loop)\n", i);

  printf("d) Use of while loop:\n");
  i = 0;
  while (i < 4) {
    printf("   i = %d\n", i);
    i++;
  }
  printf("   i = %d (after loop)\n", i);

  printf("e) Use of do while loop:\n");
  i = 4;
  do {
    printf("   i = %d\n", i);
    puts("This function doesn't need newline.");
    i++;
  } while (i < 4);
  printf("   i = %d (after loop)\n", i);

  return 0;
}
