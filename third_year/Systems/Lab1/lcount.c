#include <stdio.h>                                                                                                


int main()  {
    char c = '0';
    char prevC = '0' ;
          
    int count = -1;     //accounts for blank line at end
        
    printf("Enter your lines. Enter a blank line to finish \n");
    while (!(c == '\n' && prevC =='\n')) {
         prevC = c;
         c=getchar();  
            
         if (c == '\n') {
              count++;
         }
    }        

    
    printf("Number of lines: %d\n", count);
    return 0;
 }

