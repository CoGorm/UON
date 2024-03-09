// 0311.c
#include <stdio.h>

enum week {Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday};
enum month {Jan, Feb, Mar};

int main(void) {
    // creating today variable of enum week type
    enum week today;
    today = Wednesday;
    printf("Day %d\n",today+1);

    enum month a;
    a = Saturday;
    printf("Month %d\n", a);
    return 0;
}
