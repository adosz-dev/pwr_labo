def dwumian(n, k):
	while k > n-k:
		k = n-k
	tab = [1,] 
	for i in range(1, n+1):
		if i <= k:
			tab.append(1)
		if i-1<k:
			m = i-1
		else:
			m = k
		for j in range(m, 0, -1):
			tab[j] = tab[j] + tab[j-1]

	return tab[k]

def main():
	n = int(input("Podaj n: "))
	k = int(input("Podaj k: "))
	print(dwumian(n ,k))

if __name__ == "__main__":
	main()
