from math import sqrt

def __compute_sieve(sieve: list, n: int):
	for i in range(n+1):
		if sieve[i]:
			j = i*i
			while j < n+1:
				sieve[j] = False
				j += i

def PrimeNumbers(n):
	sieve = [True, ] * (n+1)
	sieve[0] = False
	sieve[1] = False
	__compute_sieve(sieve, n)
	return sum(sieve)

def __is_prime(primes, candidate):
	for prime in primes:
		if prime*prime > candidate:
			return True
		if candidate % prime == 0:
			return False
	return True

def Prime(n):
	primes = [2, ]
	c = 1
	candidate = 3
	while c < n:
		if __is_prime(primes, candidate):
			primes.append(candidate)
			c += 1
		candidate += 2
	return primes[-1]

def IsPrime(n):
	if n == 2:
		return True
	if n % 2 == 0:
		return False
	for dzielnik in range(3, int(sqrt(n))+1, 2):
		if n % dzielnik == 0:
			return False
	return True

def CheckParams(argv: list):
	if len(argv) != 3:
		print("nigga")
	if argv[1] not in ["pn", "pr", "ip"]:
		return False
	if not argv[2].isdigit():
		return False
	return True

