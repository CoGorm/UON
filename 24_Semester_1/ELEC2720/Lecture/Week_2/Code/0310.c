// 0310.c
#include <stdio.h>
#include <stdlib.h> // malloc, free
#include <string.h> // strcpy

int main() {
    char *aPtr = "hello";
    char b[] = "hello";
    printf("aPtr = %s\n", aPtr);
    printf("b    = %s\n", b);

    *aPtr = 'H';
    b[0] = 'H';
    printf("aPtr = %s\n", aPtr);
    printf("b    = %s\n", b);
    
    char *cPtr = NULL;
    cPtr = malloc(6 * sizeof(char));
    cPtr = "hello";
    //strcpy(cPtr,"hello");
    printf("cPtr = %s\n", cPtr);
    
    *cPtr = 'H';
    printf("cPtr = %s\n", cPtr);
    
    free(cPtr);
    
    return 0;
}
