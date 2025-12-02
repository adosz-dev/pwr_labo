with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Prime_Numbers is
	procedure Compute_Sieve (s : Sieve_Ptr) is
		j : Natural;
	begin
		s.all := (others => True);
		for i in s'Range loop
			if s(i) then
				j := i * i; 
				while j <= s'Last loop
					s(j) := False;
					j := j + i;
				end loop;
			end if;
		end loop;
	end Compute_Sieve;
	function Count_Primes (s: Sieve_Ptr) return Natural is
		c: Natural := 0;
	begin
		for i in s'Range loop
			if s(i) then
				c := c + 1;
			end if;
		end loop;
		return c;
	end Count_Primes;
  function PrimeNumbers(n: Positive) return Natural is
    procedure Free is
      new Standard.Ada.Unchecked_Deallocation(Sieve, Sieve_Ptr);
    C: Natural;
    s: Sieve_Ptr;
  begin
    if N = 0 or N = 1 then
      Put_Line("Nie istnieją żadne liczby naturalne niewiększe od" &n'Image);
      return 0;
    end if;
    s := new Sieve (2 .. n);
    Compute_Sieve(s);
    C := Count_Primes(s);
    Free(s);
    return C;
  end PrimeNumbers;
	function IsPrime(N : Positive) return Boolean is 
		Pierwiastek: Positive;
		I: Positive := 3;
	begin
		if N = 2 then
			return True;
		elsif N mod 2 = 0 then
			return False;
		else
			Pierwiastek := Integer(Sqrt(Float(N)))+1;
			while I < Pierwiastek loop
				if N mod I = 0 then
					return False;
				end if;
				I := I+2;
			end loop;
		end if;
		return True;
	end IsPrime;
	function Prime(N: Positive) return Positive is
		P : Primes_Ptr;
		C : Positive := 1;
		Candidate : Positive := 3;
		Last_Prime: Positive;
    procedure Free is
      new Standard.Ada.Unchecked_Deallocation(Primes, Primes_Ptr);
		function Find_Prime_Is_Prime(P: Primes_Ptr; Candidate, C: Natural) return Boolean is
		begin 
			for I in 0 .. C-1 loop
				if P(I)*P(I) > Candidate then
					return true;
				end if;
				if Candidate mod P(I) = 0 then
					return false;
				end if;
			end loop;
			return true;
		end Find_Prime_Is_Prime;
	begin
		P := new Primes(0 .. N);
    P(0) := 2;
		while C<N loop
			if Find_Prime_Is_Prime(P, Candidate, C) then
				P(C) := Candidate;
				C := C + 1;
			end if;
			Candidate := Candidate + 2;
		end loop;
		Last_Prime := P(N-1);
		Free(P);
		return Last_Prime;
	end Prime;
end Prime_Numbers;
