/*
 * Name: Conor Begley
 * Login: 2236693b
 * This is my own work as defined in the Academic Ethics Agreement
 *
 */

#include <stdlib.h>
#include "tldlist.h"
#include <string.h>
#include <ctype.h>

//-------------------------------------------------------------------------------
//Helper function declarations for ease of readbility further on
TLDNode * create_node(char * hostname, TLDNode * parent); 
int insert(TLDList * List, char * hostname); 
void destroy_node(TLDNode * node);
void rebalance(TLDNode * node, TLDList* tld);
char * process_hostname(char * hostname);
//-------------------------------------------------------------------------------


//AVL tree stroing all tld nodes
struct tldlist {
    //Used for filtering TLDS outside of range of dates
    Date * begin;
    Date * end;

    TLDNode * root;

    long count; //Number of sucessful adds to tldlist
};

//AVL Node representation of tld data. Stores tld string and number of instances
struct tldnode {
    //Data variables
    char * hostname;
    long count ; 

    //Connections to other node+s
    TLDNode * parent;
    TLDNode * leftChild;
    TLDNode * rightChild;
    
    //Variables for keeping AVL tree balanced
    int balance;
    int height; 
};

struct tlditerator {
    TLDNode * node;
    
  /* Initiate iter with smallest node in tld list.,
   *  however, tldmonitor assumes smallest node is gotten on first call of iter_next, 
   *  boolean start used to implement this */
   
    int start ;
};

//Create empty TLD AVL List
TLDList * tldlist_create(Date * begin, Date * end) {
    TLDList * tld;

    if ((tld =(TLDList *)malloc(sizeof(TLDList))) != NULL){
        tld->begin=begin;
        tld->end=end;
        tld->count = 0;
    }

    return tld;
}
//Free memory of tld list by freeing each node individual first
void tldlist_destroy(TLDList * tld){
    destroy_node(tld->root);
    free(tld);
}

//Add hostname to tld
int tldlist_add(TLDList * tld, char * hostname, Date * d){
   
    if(d){ //Valid date
       
        //Add hostname if date is valid 
       if((date_compare(d,tld->begin) >= 0) && (date_compare(d,tld->end) <=0)){
           int result = insert(tld, hostname);
           tld->count = tld->count + result;
           return result;
       } 
   }
    return 0;
}

//Return total count of tld
long tldlist_count(TLDList * tld) {
    return tld->count; 
}

//Create iterator for given TLD List
TLDIterator * tldlist_iter_create(TLDList * tld ){

    if(tld != NULL) { //Valid tld

        if(tld->root != NULL) {  //TLd is not empty 

            TLDIterator * iter ;

            if((iter = (TLDIterator *)malloc(sizeof(TLDIterator)))!= NULL){
                
                iter->start = 1;   //Record iter_next has not be called yet
                
                //Starting at root, go to lowest (leftmost) value
                TLDNode * node = tld->root;
                
                //As long as there is a left child, go to that, otherwise, break
                while(1) {
                    if (node->leftChild != NULL){
                        node = node->leftChild;
                    }
                    else {
                        iter->node = node;
                        break;
                    }
                }
            }
            return iter;
        }   
    }
    return NULL;
}

//Get next node in sequence, returns NULL if no more entries
TLDNode * tldlist_iter_next(TLDIterator * iter) {
    TLDNode * node = iter->node;
    

    //On first call, return iter's intialised value
    if(iter->start) {
        iter->start = 0;
        return node;
    }

    //Usual behaviour

    //If there is a bigger local node
    if (node->rightChild != NULL){

        node = node->rightChild;
        
        //Go to leftmost node of node
        while (1) {
            if (node->leftChild != NULL){
                    node = node->leftChild;
            }
            else {
                iter->node = node;
                break;
            }
        }
    }
    //If no right child, no local bigger value
    else{

        //If not root
        if(node->parent != NULL) {
        
            //Check if on left branch
            TLDNode * original = node;
            int check = 1;

            //Iterate thorugh parents, checking for larger node
            while (check) {
                
                //If parent node larger, return parent node
                if (strcmp(node->parent->hostname, node->hostname) > 0){
                    iter->node = node->parent;
                    break;
                }

                //Otherwise, go onto next parent
                node = node->parent;

                //It at root, quit
                if(node->parent == NULL){
                    check = 0;
                    break;
                }


            }
            //If no parent larger in branch, check if on root left or right branch
            if(!check) {
                
                //If at rightmost node of root left branch, go back to root
                if(strcmp(node->hostname,original->hostname) > 0){
                    iter->node=node;                
                }
                
                //Else at rightmost node of right branch and therefore no more entries
                else {
                    return NULL;
                }
            }
        }
        //If root has no children left ot iterate
        else {
            return NULL;
       }
    }
    return iter->node;
}

//Free up iter's memory
void tldlist_iter_destroy(TLDIterator * iter) {
    free(iter);
}

//Return nodes TLD value
char * tldnode_tldname(TLDNode * node) {
    return node->hostname;
}
//Return number of occurences of TLD node value
long tldnode_count(TLDNode * node) {
    return node->count;
}

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Helper functions for AVL manipulation


//Create TLD node for first encounter of hostname in file, returns NULL if it fails
TLDNode * create_node(char * hostname, TLDNode * parent) {
    TLDNode * newNode;
   
    if ((newNode =(TLDNode *)malloc(sizeof(TLDNode))) != NULL){
        newNode->hostname = hostname;
        newNode->parent = parent;
        newNode->balance=0;
        newNode->count=1;
    } 

    return newNode;
}

//Add node into AVL tree if unique, otherwise increment node count. Returns 1 if succesful, 0 if not
int insert(TLDList * tld, char * fullHostname) {

    //get domain for TLD    
    char * hostname =process_hostname(fullHostname);

    //If Tree is empty, create root node
    if (tld->root == NULL) {
        TLDNode * root;
        if((root=create_node(hostname,NULL)) != NULL) {
                tld->root = root;
                return 1;
       }
       else {
           return 0;
       }
    }

    //Else, iterate thorugh list    
    TLDNode * current = tld->root;
    TLDNode * parent;

    //While leaves not reached 
    while(1) {
    
        //If node already exists, increment count
        if (strcmp(current->hostname,hostname) == 0) {
            current->count++;
            return 1;
        }

        parent = current;

        //ELse, find next child nodes
        int goLeft = strcmp(current->hostname,hostname);    
        
        //Chose whether to go left or right
        current = (goLeft > 0) ? current->leftChild :current->rightChild;
        
        //When leaf node reached
        if (current == NULL) {
            TLDNode * Child;
            
            //If creating child is sucessful, add to parent left or right child nodes, indicated by goLeft
            if ((Child = create_node(hostname, parent)) != NULL){
                
                if(goLeft > 0) {
                    parent->leftChild = Child;
                }
                
                else {
                    parent->rightChild = Child;
                }

                //Ensure AVL tree is still balanced after insert
                rebalance(parent,tld);
                
                break;
            }

            else {
                return 0;
            }
        }   
    }
    return 1;
}

//Recursively destroy all node's children
void destroy_node(TLDNode * node) {
    if(node){
        if(node->leftChild) {
            destroy_node(node->leftChild);
        }
        if(node->rightChild) {
            destroy_node(node->rightChild);
        }
    free(node->hostname);
    free(node);
    }
}

//Balancing functions

//Get height of node, accounting for NULL
int height(TLDNode * node){
  if (node==NULL){
     return -1;
  }
  return node->height;
}

//Change height value to account for changes after balancing
void reheight(TLDNode * node) {
    if (node != NULL) {
        int childHeight;

        //Set child height to max of height of the node's children
        if (height(node->leftChild) >= height(node->rightChild)){
            childHeight=height(node->leftChild);
        }
        else {
            childHeight=height(node->rightChild);
        }

        node->height = 1 + childHeight;
    }
}

//Calculate nodes balance value after list is rebalanced
void set_balance(TLDNode * node) {
    reheight(node);
    node->balance = height(node->rightChild) - height(node->leftChild);
}

//Rotation functions for balancing
//----------------------------------------------------

TLDNode * rotate_left(TLDNode * n1) {
    TLDNode * n2 = n1->rightChild;
    n2->parent = n1->parent;
    
    n1->rightChild = n2->leftChild;

    if(n1->rightChild != NULL) {
        n1->rightChild->parent = n1;
    }

    n2->leftChild = n1;
    n1->parent = n2;

    if (n2->parent != NULL) {
        if(n2->parent->rightChild == n1) {
            n2->parent->rightChild = n2;
        }
        else {
            n2->parent->leftChild = n2;
        }
    }

    set_balance(n1);
    set_balance(n2);

    return n2;
}

TLDNode * rotate_right(TLDNode * n1) {
    TLDNode * n2 = n1->leftChild;
    n2->parent = n1->parent;

    n1->leftChild = n2->rightChild;

    if(n1->leftChild != NULL) {
        n1->leftChild->parent = n1;
    }

    n2->rightChild = n1;
    n1->parent = n2;

   if(n2->parent != NULL){
      if(n2->parent->rightChild == n1) {
         n2->parent->rightChild = n2;
      }
      else {
         n2->parent->leftChild = n2;
      }
   }

   set_balance(n1);
   set_balance(n2);

   return n2;
}

TLDNode * rotate_left_then_right(TLDNode * node) {
    node->leftChild = rotate_left(node->leftChild);
    return rotate_right(node);
}

TLDNode * rotate_right_then_left(TLDNode * node) {
    node->rightChild=rotate_right(node->rightChild);
    return rotate_left(node);
}
//----------------------------------------------------


//Rebalance function for AVL
void rebalance(TLDNode * node, TLDList* tld){
    set_balance(node);
    
    if(node->balance==-2){
        if(height(node->leftChild->leftChild)>= height(node->leftChild->rightChild)){
                node=rotate_right(node);
                }
        else {
            node = rotate_left_then_right(node);
        }
    }
    else if (node->balance==2) {
        if(height(node->rightChild->rightChild) >= height(node->rightChild->leftChild)){
            node=rotate_left(node); 
        } 
        else {
            node = rotate_right_then_left(node);
        }
    }

    if (node->parent != NULL) {
        rebalance(node->parent,tld);
    }
    else{
        tld->root = node;
    }
}

//Strips hostname down to domain
char * process_hostname(char * hostname) {
    
    char * pointer = strrchr(hostname, '.'); //Move pointer to last .

    pointer++; //point to first char after dot


    char * newHostname = (char *) malloc(sizeof(char)*(strlen(pointer)));
    
    strcpy(newHostname, pointer); //Copy after last. in hostname to new string

    //Ensure string is in lower-case
    for(int i = 0;pointer[i] != '\0';i++)
    {
        newHostname[i] = tolower(newHostname[i]);        
    }


    return newHostname ;
}
