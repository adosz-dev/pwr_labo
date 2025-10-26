#include <stdio.h>
void gcd(int *a, int *b){
	int c;
	while (*b > 0){
		c = *a%*b;
		*a = *b;
		*b = c;
	}
}
int main(){
  int a,b,c;
  printf("Podaj pierwszą liczbę: ");
  scanf("%d", &a);
  printf("Podaj drugą liczbę: ");
  scanf("%d", &b);

	gcd(&a, &b);

  printf("%d", a);

}
