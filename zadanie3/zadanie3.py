def main():
	n = int(input("Podaj liczbę n: "))
	p = int(input("Podaj podstawę p (p>=2): "))
	a = n
	m = 0
	while a>0:
		m = p*m + a%p
		a = a//p
	if n==m:
		print(f"Liczba {n} o podstawie {p} jest palindromem")
	else:
		print(f"Liczba {n} o podstawie {p} nie jest palindromem")
	


if __name__ == "__main__":
	main()
