// 0301.c
#include <stdio.h>

struct card {                           
   const char *face; // define pointer face   
   const char *suit; // define pointer suit
};                                 

int main(void) {
   struct card myCard;

   myCard.face = "Ace";   
   myCard.suit = "Spades";

   struct card *cardPtr = &myCard;

   printf("%s of %s\n", myCard.face, myCard.suit);
   printf("%s of %s\n", cardPtr->face, cardPtr->suit);
   printf("%s of %s\n", (*cardPtr).face, (*cardPtr).suit);
}
