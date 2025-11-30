from prime_numbers import (
		PrimeNumbers, 
		CheckParams,
		Prime,
		IsPrime
		)
import sys

def main():
	if not CheckParams(sys.argv):
		print("Niepoprawne parametry!")
		return -1
	n = int(sys.argv[2])

	if sys.argv[1] == "pn":
		print(PrimeNumbers(n))
	elif sys.argv[1] == "pr":
		print(Prime(n))
	else:
		print(IsPrime(n))

if __name__ == "__main__":
	main()
