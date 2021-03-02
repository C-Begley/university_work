#include "queue.h"
#include <stdlib.h>
#include <string.h>

/*
 * implementation of a FIFO queue using a linked list
 * ignore priority argument in add()
 */


struct q_element {
	struct q_element *next;
	void *value;
};

struct q_head {
	struct q_element *head;
	struct q_element *tail;
};

struct queue {
    struct q_head* q_list[MIN_PRIO];    
};

/*
 * create a Queue head that holds Items
 * returns NULL if the create call failed (malloc failure)
 */

struct q_head *head_create(void){
	struct q_head *p;

	if ((p = (struct q_head *)malloc(sizeof(struct q_head))) != NULL) {
		p->head = NULL;
		p->tail = NULL;
	}
	return p;
}

/*Createas a Queue that holds queue heads */

Queue *q_create(void) {
    struct queue *q;
    int i;

    if ((q = (struct queue *)malloc(sizeof(struct queue))) != NULL) {
       for(i=MAX_PRIO;i<=MIN_PRIO;i++){
         q->q_list[i-MAX_PRIO] = head_create();
        }
    }   
    return q;
}

/*
 * add Item to the Queue; 3rd arg is priority in MIN_PRIO..MAX_PRIO;
 * return 1/0 if successful/not-successful
 */
int q_add(Queue *q, Item i, int prio) {
	struct q_element *p;

	p = (struct q_element *)malloc(sizeof(struct q_element));
	
    if (p != NULL) {
		p->value = i;
		p->next = NULL;
		
        struct q_head *h;
        h = q->q_list[prio-MAX_PRIO];
        
        if (h->head == NULL)
			h->head = p;
		else
			h->tail->next = p;
		h->tail = p;
		return 1;
	}
	return 0;
}

/*
 * remove next Item from queue; returns NULL if queue is empty
 */
Item q_remove(Queue *q) {
	struct q_element *p;
    struct q_head *h;
	Item i;
   
    int index;
    for(index=MAX_PRIO;index<=MIN_PRIO;index++){
        h = q->q_list[index-MAX_PRIO];
       
        if (h->head == NULL){
                continue;
        }
        else {
            p = h->head;
            h->head = p->next;
    
            if (h->head == NULL) {
                    h->tail = NULL;
            }
	        i = p->value;
	        free(p);
	        return i;
        }
    }
    return NULL;
}
