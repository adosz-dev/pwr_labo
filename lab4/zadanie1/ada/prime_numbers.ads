package Prime_Numbers is
  function PrimeNumbers(N: Positive) return Natural;
  function IsPrime(N : Positive) return Boolean;
	function Prime(N: Positive) return Positive;
	type Sieve is array (Positive range <>) of Boolean;
	type Sieve_Ptr is access Sieve;
	type Primes is array(Natural range <>) of Positive;
	type Primes_Ptr is access Primes;
  private
	procedure Compute_Sieve(s: Sieve_Ptr);
	function Count_Primes(s: Sieve_Ptr) return Natural;
end Prime_Numbers;
