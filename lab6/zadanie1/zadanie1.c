#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

void odwroc(int tab[], int p, int k) {
	int c;
	while (p < k){
		c = tab[p];
		tab[p] = tab[k];
		tab[k] = c;
		p ++;
		k --;
	}
}

bool next(int tab[], int n){
  int i = n-2;
  while (i>=0 && tab[i]>tab[i+1]){
    i --;
  }
  if (i<0) return false;
  int j = n-1;
  while (tab[i]>tab[j]){
    j --;
  }
  int c = tab[j];
  tab[j] = tab[i];
  tab[i] = c;
  odwroc(tab, i+1, n-1);
	return true;
}

bool check(int tab[], int n){
	for (int i=0; i<n-1; i++){
		int hetman = tab[i];
		for (int j=i+1; j<n; j++){
			int drugi_hetman = tab[j];
			if ((hetman == drugi_hetman + (j - i)) || (hetman == drugi_hetman -(j -i))){
				return false;
			}
		}
	}
	return true;
}

void gen_tab(int tab[], int n){
	for (int i=1; i <= n; i++){
		tab[i-1] = i;
	}
}

int main(int argc, char *argv[]){
	if (argc != 2) {
		printf("Zła liczba argumentów!\n");
		return -1;
	}
	int n;
	sscanf(argv[1], "%d", &n);
	int *tab;
	tab = malloc(sizeof(int) * n);
	gen_tab(tab, n);
	int counter = 0;
	while(next(tab, n)) {
		if (check(tab, n)){
			printf("[");
			for (int i=0; i<n-1; i++){
				printf("%d, ", tab[i]);
			}
			printf("%d]\n", tab[n-1]);
			counter ++;
		}
	}
  printf("Razem %d rozwiązań\n", counter);
  free(tab);
	return 0;
}
