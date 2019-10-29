/*
 * Name: Conor Begley
 * Login: 2236693b
 * This is my own work as defined in the Academic Ethics Agreement
 *
 */

#include "date.h"
#include <stdlib.h>
#include <stdio.h>

enum dType {DAY, MONTH, YEAR}; //Used for defining values in copyArr

struct date{
    int day;
    int month;
    int year;
};

//Create date structure, checking format of string is valid
Date * date_create(char *datestr){
    //Get day, month, year from string
    int day,month,year;
    sscanf(datestr, "%d/%d/%d", &day, &month, &year);

    if((0<day && day<=31) && (0<month && month<=12) && (1983 < year)) { //Check days and month and year are valid (First TLD introduced in 1984)
	    Date * d;

        //if d sucessfully assigned, add date, month and year to date
        if ((d =(Date *)malloc(sizeof(Date))) != NULL) {
            d->day = day;
            d->month = month;
            d->year = year;
        }
        return d;
    }
	return NULL;
}

//Copies Date to new Date
Date * date_duplicate(Date * toCopy){
    Date * copy ;
    if ((copy = (Date *)malloc(sizeof(Date))) != NULL) { 
        //Copy all data 
	    copy->day = toCopy->day;
        copy->month = toCopy->month;
        copy->year = toCopy->year;
 }

	return copy;
}

// Compare two Dates, returning a value<0, 0, >0 if date1<date2,date1==date2,date1>date2
int date_compare(Date * date1, Date * date2){ 	
    if (date1->year != date2->year){
		return date1->year - date2->year;
	}
	else if (date1->month != date2->month){
		return date1->month - date2->month;
	}
	else {
		return date1->day - date2->day;
	}
}

//Frees heap storage associated with Date
void date_destroy(Date * toDestroy ) {
	free(toDestroy);
}
