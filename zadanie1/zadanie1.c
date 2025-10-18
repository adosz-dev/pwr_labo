#include <stdio.h>

int main(){
  int a,b,c;
  printf("Podaj pierwszą liczbę: ");
  scanf("%d", &a);
  printf("Podaj drugą liczbę: ");
  scanf("%d", &b);
  while (b > 0) {
		c = a%b;
		a = b;
		b = c;
  }
  printf("%d", a);

}
