package body PrimeNumbers is
	procedure Compute_Sieve (s : Sieve_Ptr) is
		j : Natural;
	begin
		s.all := (others => True);
		for i in s'Range loop
			if s(i) then
				j := i + i; 
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
end PrimeNumbers;
