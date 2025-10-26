from math import sqrt

def czy_pierwsza(x):
	if x <= 1:
		return False
	elif x == 2:
		return True
	elif x % 2 == 0:
		return False
	for i in range(3, int(sqrt(x)+1)):
		if x % i == 0:
			return False
	return True

def main():
	liczba = int(input("Podaj liczbę: "))
	if czy_pierwsza(liczba):
		print("Liczba jest pierwsza")
	else:
		print("Liczba nie jest pierwsza")

if __name__ == "__main__":
	main()
