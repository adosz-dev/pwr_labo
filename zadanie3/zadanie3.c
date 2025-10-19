#include <stdio.h>

int n, p, a, m;

int main(){
	printf("Podaj liczbę n: ");
	scanf("%d", &n);
	printf("Podaj podstawę p (p>=2): ");
	scanf("%d", &p);
	
	a = n;
	m = 0;
	
	while (a>0){
		m = p*m + a%p;
		a = a/p;
	}
	printf("Liczba %d o podstawie %d ", n, p);
	if (n==m){
		printf("jest palindromem");
	}
	else{
		printf("nie jest palindromem");
	}
}
