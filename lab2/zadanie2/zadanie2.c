#include <math.h>
#include <stdio.h>

int liczba;

int czy_pierwsza(int liczba){
	if (liczba <= 1){
		return 0;
	}
	else if (liczba == 2){
		return 1;
	}
	else if (liczba%2 == 0){
		return 0;
	}
	for (int i=3; i <= sqrt(liczba); i++){
		if (liczba%i==0){
			return 0;
		}
	}
	return 1;
}

int main(){
	printf("Podaj liczbę: ");
	scanf("%d", &liczba);
	if (czy_pierwsza(liczba)){
		printf("Liczba jest pierwsza");
	}
	else {
		printf("Liczba nie jest pierwsza");
	}


}
