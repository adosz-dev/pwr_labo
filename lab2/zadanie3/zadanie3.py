def wypisz(d, potega):
	if potega:
		if potega > 1:
			print(f"{d}^{potega}", end="")
		else:
			print(f"{d}", end="")


def rozklad(n):
	d = 3
	dd = 9
	potega = 0
	while n%2 == 0:
		potega += 1
		n = n // 2
	wypisz(2, potega)
	
	while n >= dd:
		print("*", end="")
		potega = 0
		while n%d == 0:
			n = n // d
			potega += 1
		wypisz(d, potega)

		dd = dd + 4*d +4
		d = d + 2
	if n > 1:	
		print("*", end="")
		wypisz(n, 1)


if __name__=="__main__":
	n = int(input("Podaj liczbę: "))
	print(f"{n}=",end="")
	rozklad(n)
