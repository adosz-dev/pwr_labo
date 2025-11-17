import sys
from packages.primenumbers import compute_sieve, valid_number

def main():
	if len(sys.argv) != 2:
		print("Zła liczba argumentów!")
		print(sys.argv)
		return

	n = sys.argv[1]
	if not (n:=valid_number(n)):
		return
	
	sieve = [True,]*(n+1)
	sieve[0] = False
	sieve[1] = False
	compute_sieve(sieve, n)
	primes_count = sum(sieve)

	print(f"Istnieje {primes_count} liczb pierwszych niewiększych od {n}")


if __name__ == "__main__":
	main()
