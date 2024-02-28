// 0203.c
#include <stdio.h>

void useLocal(void); // fn prototype
void useStaticLocal(void); // fn prototype
void useGlobal(void); // fn prototype

int x = 1; // global variable

int main(void) {
   int x = 5; // local variable to main
   printf("local x in outer scope of main is %d\n", x);

   { // start new scope                                    
      int x = 7; // local variable       
      printf("local x in inner scope of main is %d\n", x); 
   } // end new scope                                      

   printf("local x in outer scope of main is %d\n", x);
   useLocal(); 
   useStaticLocal(); 
   useGlobal(); 
   useLocal(); 
   useStaticLocal(); 
   useGlobal(); 

   printf("\nlocal x in main is %d\n", x);
} // end of main

void useLocal(void) {
   int x = 25;

   printf("\nlocal x in useLocal is %d after entering useLocal\n", x);
   ++x;
   printf("local x in useLocal is %d before exiting useLocal\n", x);
} 

void useStaticLocal(void) {
   static int x = 50; // initialized once

   printf("\nlocal static x is %d on entering useStaticLocal\n", x);
   ++x;
   printf("local static x is %d on exiting useStaticLocal\n", x);
} 

void useGlobal(void) {
   printf("\nglobal x is %d on entering useGlobal\n", x);
   x *= 10;
   printf("global x is %d on exiting useGlobal\n", x);
} 
