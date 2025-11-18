#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

bool czy_pierwsza(int pierwsze[], int kandydat, int c){
	for (int i = 0; i<c; i++){
		if (pierwsze[i] * pierwsze[i] > kandydat){
			return true;
		}
		if (kandydat%pierwsze[i]==0){
			return false;
		}
	}
	return true;
}

void znajdz_pierwsza(int n){
	int *pierwsze;
	pierwsze = malloc(sizeof(int)*n);
	pierwsze[0] = 2;
	int c = 1;
	int kandydat = 3;
	while (c<n){
		if (czy_pierwsza(pierwsze, kandydat, c)){
			pierwsze[c] = kandydat;
			c ++;
		}
		kandydat += 2;
	}
	printf("n-ta liczba pierwsza: %d", pierwsze[n-1]);
  free(pierwsze);
}

int main(int argc, char *argv[]){
	int n;
	printf("Podaj numer liczby pierwszej: ");
	scanf("%d", &n);
	znajdz_pierwsza(n);
}
