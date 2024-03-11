// Ass-01-DataTypes.c

#include <stdio.h>
#include <stdint.h>

int main ( void )
{
    printf ("a) Standard C data type sizes:\n");
    printf ("   -> sizeof(char)          = %2lu\n", sizeof(char));
    printf ("   -> sizeof(short)         = %2lu\n", sizeof(short));
    printf ("   -> sizeof(int)           = %2lu\n", sizeof(int));
    printf ("   -> sizeof(unsigned int)  = %2lu\n", sizeof(unsigned int));
    printf ("   -> sizeof(long)          = %2lu\n", sizeof(long));
    printf ("   -> sizeof(unsigned long) = %2lu\n", sizeof(unsigned long));
    printf ("   -> sizeof(long long)     = %2lu\n", sizeof(long long));
    printf ("   -> sizeof(float)         = %2lu\n", sizeof(float));
    printf ("   -> sizeof(double)        = %2lu\n", sizeof(double));
    printf ("   -> sizeof(long double)   = %2lu\n", sizeof(long double));

    printf ("b) Standard integer data type sizes:\n");
    printf ("   -> sizeof(int8_t)        = %2lu\n", sizeof(int8_t));
    printf ("   -> sizeof(int16_t)       = %2lu\n", sizeof(int16_t));
    printf ("   -> sizeof(int32_t)       = %2lu\n", sizeof(int32_t));
    printf ("   -> sizeof(int64_t)       = %2lu\n", sizeof(int64_t));

    printf ("c) Pointer data sizes (note they are all the same):\n");
    printf ("   -> sizeof(char *)        = %2lu\n", sizeof(char *));
    printf ("   -> sizeof(short *)       = %2lu\n", sizeof(short *));
    printf ("   -> sizeof(int *)         = %2lu\n", sizeof(int *));
    printf ("   -> sizeof(long *)        = %2lu\n", sizeof(long *));
    printf ("   -> sizeof(long long *)   = %2lu\n", sizeof(long long *));

    return 0;
}
