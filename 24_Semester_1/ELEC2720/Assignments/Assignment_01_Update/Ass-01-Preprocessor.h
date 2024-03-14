// Ass-01-Preprocessor.h

// #ifndef ASS_01_PREPROCESSOR_H_
// #define ASS_01_PREPROCESSOR_H_

// Test if DEF1 gets defined twice
#ifdef DEF1
#define DEF1_DEFINED_TWICE "Yes"
#else
#define DEF1_DEFINED_TWICE "No"
#endif /* DEF1 */

// Make some definitions
#define DEF1      // Defined only
#define DEF2 1234 // Defined to be a value

// #endif /* ASS_01_PREPROCESSOR_H_ */
