def gcd(a, b):
	while b > 0:
		a, b = b, a%b
	return a

def main():
	a = int(input("Podaj pierwszą liczbę: "))
	b = int(input("Podaj drugą liczbę: "))
	return gcd(a,b )

if __name__ == "__main__":
	print(main())
