#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "list.h"

int main(){
  char command [20];
  bool cont = true;
  int r, e;
  list l = malloc(sizeof(list_t));
  l -> first = NULL;
  l -> last = NULL;
  l -> length = 0;
  while (cont){
    printf("Command: ");
    scanf("%s", command);
    if(!strcmp(command, "pop")){
      if(!is_empty(l)){
        r = pop(l);
        printf("Result: %d\n" ,r);
      }
      else {
        printf("Error - stack is empty!\n");
      }
    }
    else if (!strcmp(command, "push")){
      printf("Value: ");
      scanf("%d", &r);
      push(l, r);
      printf("Result: OK\n");
    }
    else if (!strcmp(command, "append")){
      printf("Value: ");
      scanf("%d", &r);
      append(l, r);
      printf("Result : OK\n");
    }
    else if (!strcmp(command, "print")){
      printf("Result: ");
      print(l);
    }
    else if (!strcmp(command, "length")){
      r = length(l);
      printf("Result: %d\n", r);
    }
    else if (!strcmp(command, "exit")){
      cont = false;
    }
    else if(!strcmp(command, "put")){
      printf("Value i: ");
      scanf("%d", &r);
      printf("Value e: ");
      scanf("%d", &e);
      if (!is_empty(l) && length(l)>=r){
        put(l, r, e);
        printf("Result: OK\n");
      }
      else {
        printf("Error - Element Doesnt Exist!\n");
      }
    }
    else if(!strcmp(command, "get")){
      printf("Value: ");
      scanf("%d", &r);
      if (!is_empty(l) && length(l)>=r){
        r = get(l, r);
        printf("Result: %d\n", r);
      }
      else {
        printf("Error - Element Doesnt Exist!\n");
      }
    }
    else if(!strcmp(command, "insert")){
      printf("Value i: ");
      scanf("%d", &r);
      printf("Value e: ");
      scanf("%d", &e);
      if ((!is_empty(l) && length(l)+1 >= r) || (is_empty(l) && r==1)){
        insert(l, r, e);
        printf("Result: OK\n");
      }
      else {
        printf("Error - Out Of Bounds!\n");
      }
    }
    else if(!strcmp(command, "delete")){
      printf("Value: ");
      scanf("%d", &r);
      if (!is_empty(l) && length(l)>=r){
        delete(l, r);
        printf("Result: OK\n");
      }
      else {
        printf("Error - Element Doesnt Exist!\n");
      }
    }
    else if (!strcmp(command, "clean")){
      clean(l);
      printf("Result: OK\n");
    }
    else {
      printf("Unknown command!\n");
    }
  }
  clean(l);
  free(l);
  return 0;
}
