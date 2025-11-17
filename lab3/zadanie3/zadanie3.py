def czy_pierwsza(pierwsze, kandydat):
	for pierwsza in pierwsze:
		if pierwsza*pierwsza > kandydat:
			return True
		if kandydat % pierwsza == 0:
			return False
	return True

def znajdz_pierwsza(n):
	pierwsze = [2, ]
	c = 1
	kandydat = 3
	while c < n:
		if czy_pierwsza(pierwsze, kandydat):
			pierwsze.append(kandydat)
			c += 1
		kandydat += 2
	print(pierwsze)
	
def main():
	n = int(input("Podaj liczbę n: "))
	znajdz_pierwsza(n)


if __name__ == "__main__":
	main()
