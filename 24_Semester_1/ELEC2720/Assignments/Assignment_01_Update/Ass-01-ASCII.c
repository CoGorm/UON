//  Ass-01-ASCII.c

#include <stdio.h>

// Uncomment to enable reading characters from the console
//
// #define READ_INPUT

int main ( void )
{
#ifdef READ_INPUT
    int c;
#endif

    printf ("a) ASCII values for some characters:\n");
    printf ("   %3d => '%c'\n", 'A', 'A');
    printf ("   %3d => '%c'\n", 'a', 'a');
    printf ("   %3d => '%c'\n", '1', '1');
    printf ("   %3d => '%c'\n", '2', '2');
    printf ("b) Some escape sequences:\n");
    printf ("   %3d => '%c'\n", '\n', '\n');
    printf ("   %3d => '%c'\n", '\r', '\r');
    printf ("   %3d => '%c'\n", '\t', '\t');
    printf ("   %3d => '%c'\n", '\007', '\007');
    printf ("c) Press a key and then ENTER:\n");
  
#ifdef READ_INPUT
    fflush(stdout);
    c=getchar();
    printf ("   Read %3d => '%c'\n", c, c);
#else
    printf ("   -> Not enabled.\n");
#endif

    return 0;
}
