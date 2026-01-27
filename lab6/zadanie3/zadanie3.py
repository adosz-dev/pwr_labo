from itertools import product

def poprawny(pytanie, kod, na_miejscu, nie_na_miejscu):
	pytanie2 = list(pytanie)
	kod2 = list(kod)
	nm_kod = 0
	for i in range(len(pytanie)):
		if pytanie2[i] == kod2[i]:
			pytanie2[i] = kod2[i] = None
			nm_kod += 1
	
	nnm_kod = 0
	for i in pytanie2:
		if type(i) == int and i in kod2:
			nnm_kod += 1
			kod2[kod2.index(i)] = None
	return nnm_kod == nie_na_miejscu and nm_kod == na_miejscu

def main():
	base = [i for i in range(1, 7)]
	kombinacje = product(base, repeat=4)
	kombinacje = list(kombinacje)
	while len(kombinacje) > 1:
		pytanie = kombinacje[0]
		print(f"{pytanie}?)")
		na_miejscu = int(input("Liczba cyfr na swoim miejscu: "))
		nie_na_miejscu = int(input("Liczba cyfr nie na swoim miejscu: "))
		kombinacje = [kod for kod in kombinacje if poprawny(pytanie, kod, na_miejscu, nie_na_miejscu)]
	if (len(kombinacje) == 0):
		print("Oszukujesz!")
	else:
		print("Wygrałem!")


if __name__ == "__main__":
	main()
