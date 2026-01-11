from math import cos

def f(x):
	return cos((x)/2)

def findZero(f, a, b, eps):
	if f(a)*f(b) >= 0:
		print("W przedziale nie znajduje się miejsce zerowe!")
		return None
	if abs(b-a) < eps:
		return (a+b)/2
	while abs(b-a) >= eps:
		c = (a+b)/2
		if f(c) == 0:
			return c
		elif f(c) * f(a) < 0:
			b = c
		else:
			a = c
	return (b+a)/2

if __name__ == "__main__":
	a = float(input("Podaj a: "))
	b = float(input("Podaj b: "))
	eps = float(input("ε = 10^(-k). Podaj k: "))
	eps = 10**(-eps)

	result = findZero(f, a, b, eps)
	if result != None:
		print(result)
