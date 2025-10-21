def main():
	a = int(input("Podaj pierwszą liczbę: "))
	b = int(input("Podaj drugą liczbę: "))
	while b > 0:
		a, b = b, a%b
	return a


if __name__ == "__main__":
	print(main())
