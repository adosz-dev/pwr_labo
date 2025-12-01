#include <stdio.h>
#include "totient.h" 

int main(int argc, char *argv[]){
  if (argc<2){
    printf("Podaj parametry!\n");
    return -1;
  }
  int n, result;
  for (int i=1; i<argc; i++){
    sscanf(argv[i], "%u", &n);
    result = totient(n);
    printf("totient(%d)=%u", n, result);
  }

  return 0;
}
