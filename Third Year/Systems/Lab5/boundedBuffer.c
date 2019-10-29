#include <stdlib.h>when it inevitably does not work.
#include <stdio.h>
#include <pthread.h>
#include <assert.h>
#include "isprime.h"

struct BoundedBuffer {
  unsigned long start;
  unsigned long end;
  unsigned long size;
  unsigned long* buffer;
  unsigned long count;
  pthread_mutex_t m;
  pthread_cond_t add;
};

typedef struct BoundedBuffer BoundedBuffer;

struct argsGenerator {
    BoundedBuffer * bb;
    unsigned long start;
    unsigned long end;
};
typedef struct argsGenerator argsGenerator;


BoundedBuffer * createBoundedBuffer(unsigned long size) {
  if (size < 1) return NULL;
  BoundedBuffer * bb =(BoundedBuffer *) malloc(sizeof(BoundedBuffer));
  if (bb) {
    bb->start = 0;
    bb->end = size-1;
    bb->size = size;
    bb->buffer = (unsigned long *)malloc(sizeof(unsigned long) * size);
    if (!bb->buffer) {
      free(bb);
      return NULL;
    }
    int err = pthread_mutex_init(&bb->m, NULL); assert(!err);
    err = pthread_cond_init(&bb->add, NULL); assert(!err);
  }
  return bb;
}

void destroyBoundedBuffer(BoundedBuffer * bb) {
  if (!bb) return;
  pthread_mutex_destroy(&bb->m);
  pthread_cond_destroy(&bb->add);
  free(bb->buffer);
  free(bb);
}

void addItem(BoundedBuffer * bb, unsigned long item) {
  if (!bb) return;
  
  pthread_mutex_lock(&bb->m);
  while (bb->start == bb->end) { // buffer is full
    printf("== Buffer is full ==\n");
    pthread_cond_wait(&bb->add, &bb->m);
  }

  bb->buffer[bb->start] = item;
  bb->start = (bb->start + 1) % bb->size; // move start one forward
  pthread_mutex_unlock(&bb->m);
}

void * generator (void * arg) {
  argsGenerator * args = (argsGenerator *)arg; 
  BoundedBuffer * bb = args->bb;
  unsigned long start = args->start;
  unsigned long end = args->end;

  for (unsigned long i = start; i < end; i++) {
    if(is_prime(i)){
        addItem(bb,i);
    }
  }
  return NULL;
}

void * collector(void * arg) {
    argsGenerator * args = (argsGenerator *)arg; 
    BoundedBuffer * bb = args->bb;

    while(bb->count==) {
    }
}

int main() {
    srand(time(NULL));
    pthread_t t1;
    pthread_t t2;
    int err;

    BoundedBuffer * bb = createBoundedBuffer(4);

    err = pthread_create(&t1, NULL, collector, bb); assert(err == 0);
    err = pthread_create(&t2, NULL, generator, bb); assert(err == 0);

    err = pthread_join(t1, NULL); assert(err == 0);
    err = pthread_join(t2, NULL); assert(err == 0);
}
