// Ass-01-Functions.c

#include <stdio.h>
#include <stdint.h>
#include <math.h>

// Define return status values for mySquareRootArray
#define SRA_OK 0
#define SRA_ERR_ZERO_SIZE 1
#define SRA_ERR_NEG_VALUE 2

int16_t mySquareRootArray (int16_t a_out[], int16_t a_in[], uint16_t a_size);

int main ( void )
{
#define ARRAY_SIZE 4
  int16_t a[ARRAY_SIZE] = { 1, 4, 9 , 49};
  int16_t b[ARRAY_SIZE];
  int16_t s;
  uint16_t i;

  printf ("a) Valid input data:\n");
  if ((s = mySquareRootArray (b, a, ARRAY_SIZE)) == SRA_OK)
  {
    for (i = 0; i < ARRAY_SIZE; i++)
    {
      printf ("   sqrt(%d) = %d\n", a[i], b[i]);
    }
  }
  else
  {
    printf ("   ERROR: Return status = %d\n", s);
  }

  printf ("b) Zero size data:\n");
  if ((s = mySquareRootArray (b, a, 0)) == SRA_OK)
  {
    for (i = 0; i < ARRAY_SIZE; i++)
    {
      printf ("   sqrt(%d) = %d\n", a[i], b[i]);
    }
  }
  else
  {
    printf ("   ERROR: Return status = %d\n", s);
  }

  printf ("c) Negative input data:\n");
  a[1] = -a[1]; // Negate one input
  if ((s = mySquareRootArray (b, a, ARRAY_SIZE)) == SRA_OK)
  {
    for (i = 0; i < ARRAY_SIZE; i++)
    {
      printf ("   sqrt(%d) = %d\n", a[i], b[i]);
    }
  }
  else
  {
    printf ("   ERROR: Return status = %d\n", s);
  }

  return 0;
}

int16_t mySquareRootArray (int16_t *a_out, int16_t a_in[], uint16_t a_size)
{
  uint16_t i;

  if (a_size == 0)
  {
    return SRA_ERR_ZERO_SIZE;
  }

  for (i = 0; i < a_size; i++)
  {
    if (a_in[i] < 0)
    {
      return SRA_ERR_NEG_VALUE;
    }
    a_out[i] = sqrt (a_in[i]);
  }

  return SRA_OK;
}
