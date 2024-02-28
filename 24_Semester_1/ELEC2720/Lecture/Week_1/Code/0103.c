// 0103.c
#include <stdio.h>

int main( void )
{
   printf( "Enter two integers\n" );

   int num1; // first number
   int num2; // second number
   
   scanf( "%d %d", &num1, &num2 ); // input
   
   if ( num1 == num2 ) {                          
      printf( "%d is equal to %d\n", num1, num2 );
   } // end if                                    

   if ( num1 != num2 ) {
      printf( "%d is not equal to %d\n", num1, num2 );
   } // end if

   if ( num1 < num2 ) {
      printf( "%d is less than %d\n", num1, num2 );
   } // end if

   if ( num1 > num2 ) {
      printf( "%d is greater than %d\n", num1, num2 );
   } // end if

   if ( num1 <= num2 ) {
      printf( "%d is less than or equal to %d\n", num1, num2 );
   } // end if

   if ( num1 >= num2 ) {
      printf( "%d is greater than or equal to %d\n", num1, num2 );
   } // end if
} 
