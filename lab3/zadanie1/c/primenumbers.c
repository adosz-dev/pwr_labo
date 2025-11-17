#include "primenumbers.h"
#include <ctype.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

void compute_sieve(bool s[], unsigned n){
  unsigned i , j;
  for (i=2; i <= n; i++) s[i] = true;
  for (i=2; i<=n; i++) {
    if (s[i]){
      for (j=i*i; j <= n; j+=i){
        s[j] = false;
      }
    }
  }
}

unsigned count_primes(bool s[], unsigned n){
  unsigned i, c = 0;
  for (i=2; i <= n; i++){
    if (s[i]) c++;
  }
  return c;
} 

bool valid_number(char n[]){
  int len = strlen(n);
  for (int i=0; i < len; i++) {
    if (!isdigit(n[i])){
      printf("Argument powinien być liczbą naturalną\n");
      return false;
    }
  }
  return true;
}
