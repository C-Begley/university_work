#include <stdio.h>
#include "tldlist.c"
#include "date.c"
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


void print_tld(TLDList * tld){
    print_node(tld->root,0);
    printf("----------------------------------------- \n \n \n");
}

TLDList * create_tld() {
    Date * begin = date_create("01/01/2000");
    Date * end = date_create("01/09/2013");
    
    TLDList * tld = tldlist_create(begin, end);
    
    return tld;
}

void add_values(TLDList * tld){

    Date * d0 = date_create("05/11/2002");
    Date * d1 = date_create("12/12/2003");
    Date * d2 = date_create("05/11/2002");
    Date * d3 = date_create("31/12/2002");
    Date * d4 = date_create("25/12/2002");
    Date * d5 = date_create("01/04/2003");
    Date * d6 = date_create("01/01/2003");
    Date * d7 = date_create("14/02/2002");
    Date * d8 = date_create("01/03/2002");
    Date * d9 = date_create("01/01/2002");
    Date * d10 = date_create("28/02/2002");
    Date * d11 = date_create("30/07/2002");

    tldlist_add(tld, "www.intel.com",d0);
    tldlist_add(tld, "www.dcs.gla.ac.uk",d1);
    tldlist_add(tld, "www.mit.edu",d2);
    tldlist_add(tld, "www.cms.rgu.ac.uk",d3);
    tldlist_add(tld, "www.informatik.de",d4);
    tldlist_add(tld, "www.wiley.co.uk",d5);
    tldlist_add(tld, "www.fiat.it",d6);
    tldlist_add(tld, "www.valentine.com",d7);
    tldlist_add(tld, "www.acme.co.uk",d8);
    tldlist_add(tld, "www.comp.stand.ac.uk",d9);
    tldlist_add(tld, "www.renault.fr",d10);
    tldlist_add(tld, "www.siemens.de",d11);
}

TLDIterator * test_iter(TLDList * tld){ 
    TLDIterator * iter = tldlist_iter_create(tld);
    TLDNode * node = iter->node;
    
    while((node = tldlist_iter_next(iter))) {
        printf("%6.2f %s\n",100.0 * (double)tldnode_count(node)/12, node->hostname);
     }     
    
    return iter;
}

int main() {
    TLDList * tld = create_tld();
    add_values(tld);
    print_tld(tld);
    printf("Total added items %ld \n", tldlist_count(tld));
    TLDIterator * iter = test_iter(tld);
    tldlist_iter_destroy(iter); 
    tldlist_destroy(tld);
    
    }
