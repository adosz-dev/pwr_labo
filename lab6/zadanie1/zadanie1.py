from itertools import permutations
import sys

def main():
	args = sys.argv
	if len(args) != 2:
		print("Za mało argumentów!")
	n = int(args[1])
	zbior = []
	for i in range(n):
		zbior.append(i+1)

	permutacje = permutations(zbior, n)
	counter = 0
	for perm in permutacje:
		if check(perm):
			counter += 1
			print(perm)
	print("Liczba rozwiązań", counter)

def check(tablica):
	for i in range(len(tablica)-1):
		hetman = tablica[i]
		for j in range(i + 1, len(tablica)):
			drugi_hetman = tablica[j]
			if (hetman == drugi_hetman + (j - i)) or (hetman == drugi_hetman -(j -i)):
				return False
	return True


if __name__ == "__main__":
	main()

