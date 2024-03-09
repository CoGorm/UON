// 0206.c
// Testing input and output char array

#include <stdio.h>

int main() {
    char string1[5];
    char string2[5];
    puts("input 5 characters for string1");
    scanf("%5s", string1);
    puts("input 5 characters for string2");
    scanf("%5s", string2);
    printf("string1 = %s\n",string1);
    printf("string2 = %s\n",string2);
    return 0;
}
