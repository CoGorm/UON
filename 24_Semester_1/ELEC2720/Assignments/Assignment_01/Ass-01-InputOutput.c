//  Ass-01-InputOutput.c

#include <stdio.h>

int main(void) {
  int i;
  int c;

  puts("Enter five characters and press ENTER:");

  for (i = 1; i <= 5; i++) {
    fflush(stdout);
    c = getchar();
    printf(" Input %i : '%c'\n", i, c);

    scanf("%d", &c);
    printf(" Input %i : '%d'\n", i, c);
  }

  return 0;
}
