import math

def main():
	a = float(input("Podaj liczbę a: "))
	if a == 0:
		print("Funkcja nie ma rozwiązania w ℝ")
		return 
	b = float(input("Podaj liczbę b: "))
	c = float(input("Podaj liczbę c: "))
	
	delta = b**2 - 4 * a * c
	if delta < 0:
		print("Funkcja nie ma rozwiązania w ℝ")
	elif delta == 0:
		x = (-b)/2*a
		print(f"Funkcja posiada jedno rozwiązanie w ℝ: {x}")
	else:
		x1 = (-b - math.sqrt(delta))/2*a
		x2 = (-b + math.sqrt(delta))/2*a
		print(f"Funkcja posiada dwa rozwiązania w ℝ: {x1} i {x2}")

if __name__ == "__main__":
	main()
