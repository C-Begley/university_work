#include <stdio.h>
#include "date.c"
#include "tldlist.c"
//Program for testing TLDList structure

void print_node(TLDNode * node, int count){
    
    if(node == NULL){
        return;
    }

    printf("(%s:%ld \n", node->hostname,node->count);
    
    for (int i=0;i<count;i++){
        printf("\t");
    }
    printf("\t(LEFT:");
    if(node->leftChild != NULL) {
        print_node(node->leftChild, count + 1);
    }
    
    printf(") \n");
    for (int i=0;i<count;i++){
        printf("\t");
    }
    printf("\t(RIGHT:");
    
    if(node->rightChild != NULL) {
        print_node(node->rightChild, count + 1);
    }

    printf(")\n");

}


void print_tld(char * string,TLDList * tld){
    printf("<<<<<<<<<<<\n");
    printf("%s \n", string);
    printf("::::::::::::\n");
    print_node(tld->root,0);
    printf(">>>>>>>>>>>>\n \n \n");
}

TLDList * create_tld() {
    Date * begin = date_create("01/01/2001");
    Date * end = date_create("01/01/2010");
    
    TLDList * tld = tldlist_create(begin, end);
    print_tld("Empty list",tld);
    return tld;
}

void create_root(TLDList * tld){
    Date * d = date_create("02/02/2003");
    tldlist_add(tld, "www.a.com",d);
    print_tld("Root list",tld);
}

void add_a_few(TLDList * tld){
    Date * d = date_create("03/02/2003");
    tldlist_add(tld, "www.b.com", d);
    tldlist_add(tld, "www.c.com",d);
    tldlist_add(tld, "www.d.com",d);
    tldlist_add(tld, "www.e.com",d);
    tldlist_add(tld, "www.f.com",d);
    print_tld("Added lists",tld);
}

void add_outside_of_dates(TLDList * tld){
    Date * early = date_create("03/02/1998");
    Date * late = date_create("04/02/3000");
    tldlist_add(tld, "www.earlyshouldnotappear.com",early);
    tldlist_add(tld, "www.lateshouldnotappear.com", late);
    print_tld("Add outside of dates lists",tld);
}

TLDIterator * test_iter(TLDList * tld){    
    TLDIterator * iter = tldlist_iter_create(tld);
    TLDNode * node = iter->node;
    while(node != NULL) {
        printf("%s:%ld \n", node->hostname,node->count);
        node = tldlist_iter_next(iter);
    }
    return iter;
}

int main() {
    TLDList * tld = create_tld();
    //Add first value
    create_root(tld);
    //Add new values
    add_a_few(tld);
    
    //Add dates outside of range
    add_outside_of_dates(tld);
   
    //Add duplicates
    add_a_few(tld);
    add_a_few(tld);
    create_root(tld);
    printf("Total added items %ld \n", tldlist_count(tld));
    
    printf("\n \n \n --- \n Testing iter \n ");
    TLDIterator * iter = test_iter(tld);

    tldlist_iter_destroy(iter);
    
    tldlist_destroy(tld);
    
    }
