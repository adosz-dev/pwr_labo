#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

void gen_tabs(int n, int position[], bool bije_przek1[], bool bije_przek2[], bool bije_wiersz[]){
  for (int i=0; i<n; i++){
    position[i] = 0;
    bije_wiersz[i] = false;
  }
  for (int i=0; i<2*n-1; i++){
    bije_przek1[i] = false;
    bije_przek2[i] = false;
  }
}

void print_answer(int n, int position[]){
  printf("[");
  for (int i=0; i < n-1; i++){
    printf("%d, ", position[i]);
  }
  printf("%d]\n", position[n-1]);
}

void ustaw(int i, int n, int *counter, int position[], bool bije_wiersz[], bool bije_przek1[], bool bije_przek2[]){
  for (int j=0; j<n; j++){
    if (!(bije_wiersz[j] || bije_przek1[i+j] || bije_przek2[i-j+n-1])){
      position[i] = j + 1;
      bije_wiersz[j] = true;
      bije_przek1[i+j] = true;
      bije_przek2[i-j+n-1] = true;
      if (i<n-1){
        ustaw(i+1, n, counter, position, bije_wiersz, bije_przek1, bije_przek2);
      }
      else {
        *counter = *counter + 1;
        print_answer(n, position);
      }
      bije_wiersz[j] = false;
      bije_przek1[i+j] = false;
      bije_przek2[i-j+n-1] = false;
    }
  }
}

int main(int argc, char *argv[]){
	if (argc != 2){
		printf("Zła liczba argumentów!\n");
		return -1;
	}
  int n;
  int counter = 0;
  sscanf(argv[1], "%d", &n);
  int *position;
  bool *bije_wiersz;
  bool *bije_przek1;
  bool *bije_przek2;
  position = malloc(n*sizeof(int));
  bije_wiersz = malloc(n*sizeof(bool));
  bije_przek1 = malloc((2*n-1)*sizeof(bool));
  bije_przek2 = malloc((2*n-1)*sizeof(bool));
  gen_tabs(n, position, bije_przek1, bije_przek2, bije_wiersz);
  ustaw(0, n, &counter, position, bije_wiersz, bije_przek1, bije_przek2);
  printf("Liczba rozwiązań: %d\n", counter);
	return 0;
}
