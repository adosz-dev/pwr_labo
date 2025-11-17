#include <stdio.h>
#include <stdlib.h>

void dwumian(unsigned long n, unsigned long k){
	unsigned long *tab;
	unsigned long m;
	tab = malloc(sizeof((n+1)*sizeof(unsigned long)));
	if (k > n-k) {
		k = n-k;
	}
	tab[0] = 1;
	for (unsigned long i = 1; i <= n; i++){
		if (i <= k){
			tab[i] = 1;
		}

		if (i-1 < k){
			m = i-1;
		}
		else {
			m = k;
		}
		for (unsigned long j = m; j >= 1; j--){
			tab[j] = tab[j] + tab[j-1];
		}
	}
	printf("%lu", tab[k]);
}

int main(int argc, char *argv[]){
	unsigned long n, k;
	printf("Podaj liczbę n: ");
	scanf("%lu", &n);
	printf("Podaj liczbę k: ");
	scanf("%lu", &k);
	dwumian(n, k);
}
