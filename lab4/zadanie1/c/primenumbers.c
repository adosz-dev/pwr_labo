#include <ctype.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "primenumbers.h"

void compute_sieve(bool s[], unsigned n){
  unsigned i, j;
  for (i=2; i<=n; i++) s[i]=true;
  for (i=2; i<=n; i ++){
    if (s[i]){
      for (j=i*i; j<=n; j+=i){
        s[j] = false;
      }
    }
  }
}

unsigned count_primes(bool s[], unsigned n){
  unsigned c = 0;
  for (int i=2; i<=n; i++){
    if (s[i]) c++;
  }
  return c;
}

unsigned PrimeNumbers(unsigned n){
  unsigned c=0;
  bool *s;
  if (n == 0 || n == 1){
    printf("Nie istnieją żadne liczbę pierwsze niewiększe od %u\n", n);
    return 0;
  }
  s = malloc((n+1)*sizeof(bool));
  compute_sieve(s, n);
  c = count_primes(s, n);
  free(s);
  return c;
}

bool valid_number(char n[]){
  int len = strlen(n);
  for (int i=0; i< len; i++){
    if (!isdigit(n[i])){
      printf("Drugi parametr powinien być liczbą naturalną\n");
      return false;
    }
  }
  return true;
}

bool IsPrime(unsigned n){
  if (n == 2) return true;
  if (n%2 == 0) return false;
  unsigned nsqrt = sqrt(n);
  for (int i=3; i<=nsqrt; i += 2){
    if (n%i == 0) return false;
  }
  return true;
}

bool find_prime_is_prime(unsigned primes[], unsigned candidate, unsigned c){
  // Sprawdza czy liczba jest pierwsza dla funkcji Prime
  for (int i=0; i<c; i++){
    if (primes[i]*primes[i] > candidate){
      return true;
    }
    if (candidate%primes[i] == 0){
      return false;
    }
  }
  return true;
}

unsigned Prime(unsigned n){
  unsigned *primes;
  primes = malloc(sizeof(unsigned)*n);
  primes[0] = 2;
  unsigned c = 1;
  unsigned candidate = 3;
  while (c<n){
    if (find_prime_is_prime(primes, candidate, c)){
      primes[c] = candidate;
      c ++;
    }
    candidate += 2;
  }
  unsigned last_prime = primes[n-1];
  free(primes);
  return last_prime;
}
