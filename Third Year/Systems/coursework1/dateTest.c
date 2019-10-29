#include "date.c"
#include <stdio.h>
//print date data
void printDate(Date * date) {
	printf("Day: %d, Month: %d, Year: %d \n", date->day, date->month, date->year);
}

//Test dates create ok
void creating_dates() {
	Date * d=date_create("22/11/2006");
	Date * d1=date_create("03/07/1997");
	printf("Created dates \n");
	printDate(d);
	printDate(d1);
	date_destroy(d);
	date_destroy(d1);
}

//Test duplicating dates work
void duplicating_dates(){
    Date * d=date_create("22/11/2006");
	Date * d1 = date_duplicate(d);
    
	printf("Copying dates \n");
	printDate(d);
	printDate(d1);
	date_destroy(d);
	date_destroy(d1);
}

void comparing_dates() {
    Date * d=date_create("22/11/2006");

    Date * equal = date_duplicate(d);
   
    Date * lessMonth =date_create("22/07/2006");
    Date * lessYear=date_create("22/11/2001");
    Date * lessDay=date_create("04/11/2006");

    printf("Equal: %d \n", date_compare(d,equal));
    printf("Equal: %d \n", date_compare(d,equal));

    printf("Greater than: %d \n", date_compare(d,lessYear));
    printf("Greater than: %d \n", date_compare(d,lessMonth)); 
    printf("Greater than: %d \n", date_compare(d,lessDay));
   
    printf("Less than: %d \n", date_compare(lessYear,d));
    printf("Less than: %d \n", date_compare(lessMonth,d)); 
    printf("Less than: %d \n", date_compare(lessDay,d));
    
    date_destroy(d);
    date_destroy(equal);
    date_destroy(lessMonth);
    date_destroy(lessYear);
    date_destroy(lessDay);
}

int main() {	
	//Test date
    creating_dates();
   	duplicating_dates();
    comparing_dates();
}
