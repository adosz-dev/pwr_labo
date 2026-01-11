#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <stdbool.h>

typedef double (*functype)(double);

double f(double x) {
	return cos(x/2);
}

double findZero(functype f, double a, double b, double eps){
	double c;
	if (fabs(b-a) < eps){
		return (a+b)/2;
	}
	while (fabs(b-a) >= eps){
		c = (a+b)/2;
		if (f(c) == 0){
			return c;
		}
		else if (f(c) * f(a) < 0){
			b = c;
		}
		else {
			a = c;
		}
	}
	return (a+b)/2;
}

bool hasZero(functype f, double a, double b){
	if (f(a) * f(b) >= 0){
		printf("W przedziale nie znajduje się miejsce zerowe!");
		return false;
	}
	return true;
}

int main(){
	double a, b, eps, result;
	printf("Podaj a: ");
	scanf("%lf", &a);
	printf("Podaj b: ");
	scanf("%lf", &b);
	printf("ε = 10^(-k). Podaj k: ");
	scanf("%lf", &eps);
	eps = pow(10, -eps);
	if (!hasZero(f, a, b)) {
		return -1;
	}
	result = findZero(f, a, b, eps);
	printf("%lf\n", result);
	return 0;
}
