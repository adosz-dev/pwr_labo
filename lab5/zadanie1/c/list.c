#include <stdio.h>
#include <stdlib.h>
#include "list.h"

bool is_empty(list l){
  return l -> first == NULL;
}

int pop(list l){
  node_ptr n = l -> first;
  int e = n -> elem;
  l -> first = l -> first -> next;
  if (l -> first == NULL) // last element
    l -> last = NULL;
  free(n);
  l -> length --;
  return e;
}

void clean(list l){
  while (!is_empty(l)){
    pop(l);
  }
}

int get(list l, int i){
  node_ptr n = l -> first;
  for (int j=2; j<=i; j++){
    n = n -> next;
  }
  int e = n -> elem;
  return e;
}

void put(list l, int i, int e){
  node_ptr n= l -> first;
  for (int j=2; j<=i; j++){
    n = n -> next;
  }
  n -> elem = e;
}

void delete(list l, int i){
  if (i == 1) {
    pop(l);
  }
  else {
    node_ptr n = l -> first;
    int len = length(l);
    
    for (int j=2; j<i; j++){
      n = n -> next;
    }
    node_ptr m = n -> next;
    if (i == len){
      n -> next = NULL;
      l -> last = n;
    }
    else {
      n -> next = m -> next;
    }
    free(m);
    l -> length --;
  }
}

void insert(list l, int i, int e){
  if (i == 1){
    push(l, e);
  }
  else if (length(l)+1 == i){
    append(l, e);
  }
  else {
    node_ptr n = l -> first;
    for (int j=2; j<i; j++){
      n = n -> next;
    }
    node_ptr c = malloc(sizeof(node));
    c -> next = n -> next;
    n -> next = c;
    c -> elem = e;
    l -> length ++;
  }
}

void push(list l, int e){
  node_ptr n = malloc (sizeof (node));
  n -> elem = e;
  n -> next = l -> first;
  l -> first = n;
  if (l -> last == NULL) // first element
    l -> last = n;
  l -> length ++;
}

void append(list l , int e) {
  node_ptr n = malloc(sizeof(node));
  n -> elem = e;
  if (l -> first == NULL){// first element
    l -> first = n;
  }
  else {
    l -> last -> next = n;
  }
  l -> last = n;
  l -> length ++;
}
void print(list l ){
  node_ptr n = l -> first;
  while (n != NULL ){
    printf ("%d ", n -> elem);
    n = n -> next;
  }
  printf("(%d)\n", length(l));
}

int length (list l){
  int len = l -> length;
  return len;
}

