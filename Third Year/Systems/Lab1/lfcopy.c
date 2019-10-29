#include <stdio.h>
#include <string.h>
#define lenght 50

/* 
readline: read a line from standard input, return its length or 0 
*/

int readline(char line[], int max){
	if (fgets(line, max, stdin) == NULL)
		return 0;
	else
		return strlen(line);
}

/* writeline: write line to standard output, return number of chars 
written */

int writeline(const char line[]){
	fputs(line, stdout);
	return strlen(line);
}

int main() {
		char line[lenght];
         printf("Enter line, enter nothing to quit \n");		

        //Keep readin lines until an empty line is provided
        
        while (readline(line, lenght) >1) {                            // Empty string is still 1 char long
                writeline(line);
                printf("Enter line, enter nothing to quit \n");		
             }
        return 0;
}
