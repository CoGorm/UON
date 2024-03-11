#include <stdio.h>

int main() {
  float numbers[] = {-12.3545, 23.45, 999.0, -987.621};
  int size = sizeof(numbers) / sizeof(numbers[0]);

  // Using %6.2f - Doesn't guarantee alignment
  printf("Using %%d:\n");
  for (int i = 0; i < size; i++) {
    printf("%f \n", numbers[i]);
  }
  printf("\n");

  // Using %6.2f - Doesn't guarantee alignment
  printf("Using %%6.2f:\n");
  for (int i = 0; i < size; i++) {
    printf("%6.2f \n", numbers[i]);
  }
  printf("\n");

  // Using %6.2f - Doesn't guarantee alignment
  printf("Using %%-6.2f:\n");
  for (int i = 0; i < size; i++) {
    printf("%-6.2f \n", numbers[i]);
  }
  printf("\n");

  // Using %6.2f - Doesn't guarantee alignment
  printf("Using %%7.2f:\n");
  for (int i = 0; i < size; i++) {
    printf("%7.2f \n", numbers[i]);
  }
}
