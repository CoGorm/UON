// Ass-01-File.c

#include <stdio.h>
#include <stdint.h>

int main ( void )
{
    const char *FileNameBinary = "Test.bin";
    const char *FileNameText = "Test.txt";
    FILE *fp;
    double dd_out = 1.234;
    double dd_in = 0.0;

    printf ("a) Binary file (%s):\n", FileNameBinary);
    printf ("   INFO: dd_out = %f\n", dd_out);
    printf ("   INFO: dd_in  = %f\n", dd_in);
    printf ("   INFO: sizeof(dd_out)  = %lu\n", sizeof(dd_out));    

    // Open file for writing
    if ((fp = fopen (FileNameBinary, "wb")) == NULL)
    {
	printf ("   ERROR: Opening file for writing\n");
	return 1;
    }

    // Write double value to file
    if (fwrite (&dd_out, sizeof(dd_out), 1, fp) != 1)
    {
	printf ("   ERROR: Writing double to file\n");
	fclose (fp);
	return 1;
    }

    // Close file
    if (fclose (fp) != 0)
    {
	printf ("   ERROR: Closing file after writing\n");
	fclose (fp);
	return 1;
    }

    // Open file for reading
    if ((fp = fopen (FileNameBinary, "rb")) == NULL)
    {
	printf ("   ERROR: Opening file for reading\n");
	return 1;
    }

    // Read double value from file
    if (fread (&dd_in, sizeof(dd_in), 1, fp) != 1)
    {
	printf ("   ERROR: Reading double from file\n");
	fclose (fp);
	return 1;
    }

    // Close file
    fclose (fp);

    printf ("   INFO: dd_out = %f\n", dd_out);
    printf ("   INFO: dd_in  = %f\n", dd_in);

    printf ("b) Text file output (%s):\n", FileNameText);

    // Open file for writing
    if ((fp = fopen (FileNameText, "w")) == NULL)
    {
	printf ("   ERROR: Opening file for writing\n");
	return 1;
    }

    // Write some text to file
    if (fprintf (fp, "Hello Assignment 1") == 0)
    {
	printf ("   ERROR: Writing text to file\n");
	fclose (fp);
	return 1;
    }

    // Close file
    if (fclose (fp) != 0)
    {
	printf ("   ERROR: Closing file after writing\n");
	fclose (fp);
	return 1;
    }

    printf ("   INFO: Output text file.\n");

    return 0;
}
