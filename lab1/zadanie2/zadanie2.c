#include <stdio.h>
#include <math.h>

int main(){
	float a, b, c, delta;
	printf("Podaj liczbę a: ");
	scanf("%f", &a);
	if (a == 0){
		printf("Funkcja nie jest funkcją kwadratową");
		return 0;
	}
	printf("Podaj liczbę b: ");
	scanf("%f", &b);
	printf("Podaj liczbę c: ");
	scanf("%f", &c);

	delta = b*b - 4*a*c;
	if (delta < 0){
		printf("Funkcja nie ma rozwiązania w ℝ");
	}
	else if (delta == 0){
		float x = (-b)/(2*a);
		printf("Funkcja posiada jedno rozwiązanie w ℝ: %f", x);
	}
	else {
		float x1 = (-b - sqrt(delta))/(2*a);
		float x2 = (-b + sqrt(delta))/(2*a);
		printf("Funkcja posiada dwa rozwiązania w ℝ: %f %f", x1, x2);
	}
	return 0;
}
