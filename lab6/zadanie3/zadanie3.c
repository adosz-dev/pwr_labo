#include <stdio.h>
#include <stdbool.h>

void gen_tab(int kombinacje[][4]){
	int i = 0;
	for (int a=1; a <= 6; a++){
		for (int b=1; b<=6; b++){
			for (int c=1; c <= 6; c++){
				for(int d=1; d<=6; d++){
					kombinacje[i][0] = a;
					kombinacje[i][1] = b;
					kombinacje[i][2] = c;
					kombinacje[i][3] = d;
					i ++;
				}
			}
		}
	}
}


bool poprawny(int pytanie[], int kod[], int na_miejscu, int nie_na_miejscu) {
    int pytanie2[4], kod2[4];
    for (int i = 0; i < 4; i++) {
        pytanie2[i] = pytanie[i];
        kod2[i] = kod[i];
    }

    int nm_kod = 0;
    for (int i = 0; i < 4; i++) {
        if (pytanie2[i] == kod2[i]) {
            pytanie2[i] = kod2[i] = -1;
            nm_kod++;
        }
    }

    int nnm_kod = 0;
    for (int i = 0; i < 4; i++) {
        if (pytanie2[i] != -1) {
            for (int j = 0; j < 4; j++) {
                if (kod2[j] == pytanie2[i]) {
                    nnm_kod++;
                    kod2[j] = -1;
                    break;
                }
            }
        }
    }
    return ((nnm_kod == nie_na_miejscu) && (nm_kod == na_miejscu));
}

int main(){
	int kombinacje[6*6*6*6][4];
	int rozmiar = 6*6*6*6;
	gen_tab(kombinacje);
	while (rozmiar>1){
		int pytanie[4];
		for (int i = 0; i < 4; i++) {
				pytanie[i] = kombinacje[0][i];
		}
		printf("%d %d %d %d?\n", pytanie[0], pytanie[1], pytanie[2], pytanie[3]);

		int na_miejscu, nie_na_miejscu;
		printf("Liczba cyfr na swoim miejscu: ");
		scanf("%d", &na_miejscu);
		printf("Liczba cyfr nie na swoim miejscu: ");
		scanf("%d", &nie_na_miejscu);

		int rozmiar2 = 0;
		for (int i = 1; i < rozmiar; i++) {
				if (poprawny(pytanie, kombinacje[i], na_miejscu, nie_na_miejscu)) {
						for (int j = 0; j < 4; j++) {
								kombinacje[rozmiar2][j] = kombinacje[i][j];
						}
						rozmiar2++;
				}
		}
		rozmiar = rozmiar2;
	}
	if (rozmiar == 0) {
		printf("Oszukujesz!\n");
  }
	else {
		printf("Wygrałem!");
  }
	return 0;
}
