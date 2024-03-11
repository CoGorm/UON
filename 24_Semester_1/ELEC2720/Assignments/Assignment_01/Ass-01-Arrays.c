// Ass-01-Arrays.c

#include <stdio.h>
#include <stdint.h>

int main ( void )
{
    int16_t a[3];    // Declare an array of three int16_t

    printf ("a) Indexing array elements:\n");
    a[0] = 10;
    a[1] = 20;
    a[2] = 30;
    printf ("   a[0] = %d, a[1] = %d, a[2] = %d\n",
	    a[0], a[1], a[2]);

    printf ("b) Array name as pointer:\n");
    printf ("   a = %p\n", a);
    printf ("   &(a[0]) = %p, &(a[1]) = %p, &(a[2]) = %p\n",
	    &(a[0]), &(a[1]), &(a[2]));

    printf ("c) Pointer arithmetic:\n");
    printf ("   (a+0) = %p, (a+1) = %p, (a+2) = %p\n",
	    (a + 0), (a + 1), (a + 2));
    printf ("   *(a+0) = %d, *(a+1) = %d, *(a+2) = %d\n",
	    *(a + 0), *(a + 1), *(a + 2));

    printf ("d) Note the need for parenthesis:\n");
    printf ("   *a+0 = %d, *a+1 = %d, *a+2 = %d\n",
	    *a+0, *a+1, *a+2);

    return 0;
}
