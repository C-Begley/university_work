#include <stdio.h>
#include <ctype.h>

int main(){
        char c = '0';
        char prevC = '0';
        int word = 0; //Boolean indicating if previuous char was part of word
        int count = 0;
       
        printf("Enter lines. Enter a blank line to escape \n");
        
        while (!(c=='\n' &&  prevC=='\n')) { //While not end of lines
                prevC =c;
                c= getchar();

                if (! isalpha(c)) {  // If the character is not a word.
                        if(word ==1){ //If last char was part of word
                                count++; //Add one to word count
                                word = 0; //Set word to flase
                        }
                }
               
                else if(word == 0) { //Else if word is false
                        word = 1; //Set word to true
                }
        }
        printf("%d words", count);
        return 0;
}


         
