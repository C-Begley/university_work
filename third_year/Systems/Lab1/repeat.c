#include <stdio.h>

int main(){
	char character;
	
	printf("Enter a character: (0 to exit)\n");
	scanf(" %c",&character);
	
	while (character !='0'){
		printf("Entered: %c \n",character);
		scanf(" %c",&character);
	}

	return 0;
}
