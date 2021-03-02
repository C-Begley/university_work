#include <stdlib.h>
#include <stdio.h>

struct buffer {
	int * ptr;
    int count;
	int max_size;
	
	// constructor
	buffer(int initial_size) {
    	ptr = (int*)malloc(sizeof(int) * initial_size);  //... allocate enough memory for the given initial_size
	count=0, max_size=initial_size;
	}
	
	~buffer() {
		free(ptr);  //... free memory
	}
	
	void add (int element) {
		if (count < max_size) { // check if there is enough room left.
			ptr[count++] = element;
		}

		else { // If not, allocate new memory with enough space and
			int * new_ptr =  (int*)malloc(sizeof(int) * (max_size +1)); 
			for (int i = 0; i<max_size+1; i++){
				new_ptr[i] = ptr[i];
			}

			new_ptr[max_size++] = element;
			count ++;

			//Ensure to not leak memory!
		    int * temp = ptr;
			ptr = new_ptr;
			free(temp);

		}
	}

    void print_buf() {
		printf("Max Size : %d \n", max_size);
		for(int i=0;i<max_size;i++){
			printf("Element %i: %d \n", i, ptr[i]);
		}
		printf("\n");
}


};
typedef struct buffer buffer;

int main() {
	buffer b(3); // allocate space for 3 ints
	
	for (int i =1 ; i< 7; i++){
		b.add(i);
		b.print_buf();
	}
}
