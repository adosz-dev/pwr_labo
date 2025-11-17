#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#include "primenumbers.h"

int main(int argc, char *argv[]){
  unsigned n, c;
  bool *s;

  if (argc != 2){
    printf("Zła liczba argumentów");
    return -1;
  }
  if (!valid_number(argv[1])){
    return -1;
  }

  sscanf(argv[1], "%lu", &n);
  if (n == 0 || n == 1){
    printf("Nie istnieją żadne liczby pierwsze niewiększe od %lu\n", n);
    return 0;
  }
  s = malloc((n+1)*sizeof(bool));
  compute_sieve(s, n);
  c = count_primes(s, n);
  free(s);
  printf("Ist. %lu l. pierwsz. niewiększ. od %lu", c, n);
  return 0;
}
