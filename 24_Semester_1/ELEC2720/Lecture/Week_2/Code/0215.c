// 0215.c
#include <stdio.h>

int function1(int); // a function

int main() {
    int (*f)(int); // a ptr to fn
    
    f = function1; // assign ptr
    printf("%d", (*f)(2)); // call function
}

int function1(int a) {
   return a * a;
} 
