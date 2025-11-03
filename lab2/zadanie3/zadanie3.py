def wypisz(dzielniki, n):
	elementy = []
	print(f"{n}=",end="")
	for d, potega in dzielniki.items():
		if potega:
			if potega > 1:
				elementy.append(f"{d}^{potega}")
			else:
				elementy.append(f"{d}")
	print("*".join(elementy))


def rozklad(n, dzielniki):
	d = 3
	dd = 9
	potega = 0

	while n%2 == 0:
		potega += 1
		n = n // 2
	dzielniki[2] = potega
	
	while n >= dd:
		potega = 0
		while n%d == 0:
			n = n // d
			potega += 1
		dzielniki[d] = potega

		dd = dd + 4*d +4
		d = d + 2
	if n > 1:
		dzielniki[n] = 1

if __name__=="__main__":
	n = int(input("Podaj liczbę: "))
	dzielniki = {}
	rozklad(n, dzielniki)
	wypisz(dzielniki, n)
