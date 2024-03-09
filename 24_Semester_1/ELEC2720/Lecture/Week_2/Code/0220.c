// 0220.c
#include <stdio.h>
int main() {
    void *vPtr;
    int a = 10;
    float b = 20;
    vPtr = &a;
    printf("%d\n", *(int *)vPtr);
    vPtr = &b;
    printf("%f\n", *(float *)vPtr);
    printf("%d\n", *(int *)vPtr);
    return 0;
}
