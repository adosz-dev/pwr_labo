import sys

counter = 0

def ustaw(i, n, position, bije_wiersz, bije_przek1, bije_przek2):
	global counter
	for j in range(n):
		if not(bije_wiersz[j] or bije_przek1[i+j] or bije_przek2[i-j+n-1]):
			position[i] = j + 1
			bije_wiersz[j] = True
			bije_przek1[i+j] = True;
			bije_przek2[i-j+n-1] = True;

			if i<n-1:
				ustaw(i+1, n, position, bije_wiersz, bije_przek1, bije_przek2)
			else:
				counter += 1
				print(position)
			bije_wiersz[j] = False
			bije_przek1[i+j]= False
			bije_przek2[i-j+n-1] = False

def hetman(n):
	position = [0,] * n
	bije_wiersz = [False, ] * n
	bije_przek1 = [False, ] * (2*n-1)
	bije_przek2 = [False, ] * (2*n-1)
	ustaw(0, n, position, bije_wiersz, bije_przek1, bije_przek2)
	print(f"Liczba rozwiązań: {counter}")

def main():
	if len(sys.argv) != 2:
		print("Zła liczba argumentów")
		return
	n = int(sys.argv[1])
	hetman(n)
if __name__ == "__main__":
	main()
