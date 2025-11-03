#include <stdio.h>
#include <stdlib.h>

int n;

void wypisz(int n, int tab[]){
	int pierwszy = 1;

	printf("%d=", n);
	for (int i=0; i < n; i ++){
		if (tab[i]){
			if (!pierwszy) {
				printf("*");
			}
			else {
				pierwszy = 0;
			}

			if (tab[i] > 1){
				printf("%d^%d", (i+2), tab[i]);
			}
			else {
				printf("%d", (i+2));
			}
		}
	}
}

void rozklad(int n, int tab[]){
	int d = 3;
	int dd = 9;

	while (n%2 == 0){
		tab[0] ++;
		n = n / 2;
	}

	while (n >= dd){
		while (n%d == 0){
			n = n / d;
			tab[d-2] ++;
		}

		dd = dd + 4*d + 4;
		d = d + 2;
	}
	if (n > 1){
			tab[n-2] = 1;
	}
	
}

int main(){
	int *tab;
	printf("Podaj liczbę: ");
	scanf("%d", &n);
	tab = malloc(sizeof(int)*(n-1));
	for (int i=0; i < n; i++){
		tab[i]=0;
	}
	rozklad(n, tab);
	wypisz(n, tab);

}
