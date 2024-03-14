// Ass-01-Operators.c

#include <stdint.h>
#include <stdio.h>

int main(void) {
  uint8_t a1 = 20;
  uint8_t a2 = 15;
  uint8_t a3;
  uint16_t b1 = 20;
  uint16_t b2 = 15;
  uint16_t b3;
  float f1 = 20.0;
  float f2 = 15.0;
  float f3;

  printf("a) Arithmetic operations:\n");
  a3 = a1 + a2;
  b3 = b1 + b2;
  f3 = f1 + f2;
  printf("   a1+a2 = %d, b1+b2 = %d, f1+f2 = %f\n", a3, b3, f3);
  a3 = a1 - a2;
  b3 = b1 - b2;
  f3 = f1 - f2;
  printf("   a1-a2 = %d, b1-b2 = %d, f1-f2 = %f\n", a3, b3, f3);
  a3 = a1 * a2;
  b3 = b1 * b2;
  f3 = f1 * f2;
  printf("   a1*a2 = %d, b1*b2 = %d, f1*f2 = %f\n", a3, b3, f3);
  a3 = a1 / a2;
  b3 = b1 / b2;
  f3 = f1 / f2;
  printf("   a1/a2 = %d, b1/b2 = %d, f1/f2 = %f\n", a3, b3, f3);
  a3 = a1 % a2;
  b3 = b1 % b2;
  printf("   a1%%a2 = %d, b1%%b2 = %d\n", a3, b3);

  printf("b) Effect of implicit and explicit type casting:\n");
  f3 = a1 / a2;
  printf("   a1/a2 = %f (implicit)\n", f3);
  f3 = (float)a1 / (float)a2;
  printf("   a1/a2 = %f (explicit)\n", f3);

  printf("c) Comparison operations:\n");
  printf("   a1==a2 = %d, a1!=a2 = %d\n", a1 == a2, a1 != a2);
  printf("   a1<a2  = %d, a1>a2  = %d\n", a1<a2, a1> a2);
  printf("   a1<=a2 = %d, a1>=a2 = %d\n", a1 <= a2, a1 >= a2);
  printf("   a1 = a1 - 1= %d\n", a1 == a1 - 1);

  return 0;
}
