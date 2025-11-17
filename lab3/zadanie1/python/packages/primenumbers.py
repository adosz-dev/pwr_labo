def compute_sieve(sieve: list, n: int):
	for i in range(n+1):
		if sieve[i]:
			j = i * i
			while j < len(sieve):
				sieve[j] = False
				j = j + i

def valid_number(n):
	if n.isdigit():
		n = int(n)
		if n > 1:
			return n 
		elif n in [0,1]:
			print(f"Nie istnieją żadne liczby pierwsze niewiększe od {n}")
			return False
	print("Drugi argument powinien być liczbą naturalną")
	return False
