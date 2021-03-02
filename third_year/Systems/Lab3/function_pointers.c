#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#define COUNT 4

enum sorting {first, second};

struct name {
    const char * first_name;
    const char * last_name;
};
typedef struct name name;


int sort_first (const void * a, const void * b) {
	name * n1 = (name *) a;
	name * n2 = (name *) b;

	return strcmp(n1->first_name, n2->first_name);
}

int sort_last (const void * a, const void * b) {
	name * n1 = (name *) a;
	name * n2 = (name *) b;

	return strcmp(n1->last_name, n2->last_name);
}


void print_names (name * name_list, enum sorting type){
	for (int i = 0; i<COUNT; i++){
		if (type ==first) {
			printf("%s, %s \n",name_list[i].first_name, name_list[i].last_name);
	    }
		else {
	    	printf("%s, %s \n",name_list[i].last_name, name_list[i].first_name);
		}
	}
	printf("\n");
}

int main() {
	name names[COUNT] = {
		{"Grace", "Hopper"},
		{"Dennis", "Ritchie"},
		{"Ken", "Thompson"},
		{"Bjarne", "Stroustrup"},
	};
    // sort array using qsort by first name	
	qsort(names,COUNT,sizeof(name),sort_first);
   
   	// print array
	print_names (names, first);
  
  	// sort array using qsort
	qsort(names,COUNT,sizeof(name),sort_last);
	print_names (names, second);

}

