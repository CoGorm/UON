// Ass-01-FormattedOutput.c

#include <stdio.h>

int main ( void )
{
  // Declare some variables and initialise them
  char s[] =
    { "This is a string" };
  char c = 'A';
  int i = 1234;
  float f = 12.3456;

  // Output formatted strings
  printf ("a) Output a string: %s\n", s);
  printf ("b) Output a character: %c\n", c);
  printf ("   -> As integer: %d\n", c);
  printf ("c) Output an integer: %d\n", i);
  printf ("   -> With seven characters: %7d\n", i);
  printf ("   -> With seven characters and leading zeros: %07d\n", i);
  printf ("d) Output a float: %f\n", f);
  printf ("   -> With six characters and two decimal places: %6.2f\n", f);

  return 0;
}
