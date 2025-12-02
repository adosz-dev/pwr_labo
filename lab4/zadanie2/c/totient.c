unsigned totient(unsigned n){
	unsigned result = n;
	unsigned p = 2;
	while (p*p <= n){
		if (n%p == 0){
			while (n%p == 0){
				n = n / p;
			}
			result -= result / p;
		}
		p ++;
	}
	if (n>1){
		result -= 1;
	}
	return result;
}
