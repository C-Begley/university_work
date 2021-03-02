#include <stdio.h>
#define N 20

void swap(int * a, int * b){
        int * temp = a;
        a = b;
        b = temp;
}

void siftup(int x[], int n) {
    /* preconditions: n > 0 && heap(1,n-1)
    * postcondition: heap(1, n)
    */
    int p, i = n;
    while (i > 1) {
        p = i / 2;
        if (x[p] <= x[i])
            break;
        swap(x+p, x+i);
        i = p;
    }
}

void siftdown(int x[], int n) {
    /* preconditions: heap(2, n) && n >= 0
    * postcondition: heap(1, n)
    */
    int c, i;
    i = 1;
    while (1) {
        c = 2 * i;
        if (c > n)
            break;
        if ((c+1) <= n)
            if (x[c+1] < x[c])
                c++;
        if (x[i] <= x[c])
            break;
        swap(x+c, x+i);
        i = c;
    }
}

int * q_create(void) {
    int q[N+1];
    return q; 
}     
        

