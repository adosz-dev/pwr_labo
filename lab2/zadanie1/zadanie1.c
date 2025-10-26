#include <stdio.h>
int gcd(int a, int b){
	int c;
	while (b > 0){
		c = a%b;
		a = b;
		b = c;
	}
	return a;
}
int main(){
  int a,b,c;
  printf("Podaj pierwszą liczbę: ");
  scanf("%d", &a);
  printf("Podaj drugą liczbę: ");
  scanf("%d", &b);

	a = gcd(a, b);

  printf("%d", a);

}
