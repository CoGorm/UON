// 0108.c
#include <stdio.h>

int main(void) {
  // initialization phase
  int total = 0;   // initialize total
  int counter = 0; // initialize loop counter

  // processing phase: get the first grade
  printf("%s", "Enter grade, -1 to end: "); // prompt for input
  int grade = 0;                            // grade value
  scanf("%d", &grade);                      // get grade

  // loop while sentinel not entered
  while (grade != -1) {
    total = total + grade; // add grade
    counter = counter + 1; // increment counter

    // get next grade from user
    printf("%s", "Enter grade, -1 to end: "); // prompt for input
    scanf("%d", &grade);                      // read next grade
  }                                           // end while

  // termination phase: some grades entered
  if (counter != 0) {
    // calculate average of all grades
    double average = (double)total / counter; // avoid truncation

    // display average
    printf("Class average is %.2f\n", average); // two digits of precision
  }                                             // end if
  else {                                        // if no grades were entered
    puts("No grades were entered");
  } // end else
} // end function main
