#include <stdio.h>
#include <string.h>

#include "primenumbers.h"

int main(int argc, char *argv[]){
  unsigned n = 0;
  if (argc != 3){
    printf("Zła liczba parametrów\n");
    return -1;
  }
  if (!valid_number(argv[2])){
    return -1;
  }
  sscanf(argv[2], "%u", &n);
  if (strcmp(argv[1], "pn") == 0){
    printf("%u", PrimeNumbers(n));
  }
  else if (strcmp(argv[1], "pr") == 0){
    if (n!=0){
      printf("%u", Prime(n));
    }
    else {
      printf("Podaj numer liczby pierwszej!\n");
    }
  }
  else if (strcmp(argv[1], "ip") == 0){
    if (IsPrime(n)){
      printf("true\n");
    }
    else {
      printf("false\n");
    }
  }
  else {
    printf("Błędny parametr");
    return -1;
  }
  return 0;
}
