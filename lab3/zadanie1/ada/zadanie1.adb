with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Unchecked_Deallocation;
with PrimeNumbers; use PrimeNumbers;

Procedure Zadanie1 is
	procedure Free is
		new Standard.Ada.Unchecked_Deallocation(Sieve, Sieve_Ptr);
	n : Natural;
	c : Natural;
	s : Sieve_Ptr;
begin
	if Argument_Count /= 1 then
		Put_Line("Zła liczba argumentów");
		return;
	end if;
	n := Natural'Value(Argument(1));
	if n = 0 or n = 1 then
		Put_Line("Nie istnieją żadne liczby naturalne niewiększe od" &n'Image);
		return;
	end if;
	s := new Sieve (2 .. n);
	Compute_Sieve(s);
	c := Count_Primes(s);
	Free(s);
	Put_Line("Ist." &c'Image &" l. pierwsze niewiększ. od" &n'Image);
exception
	when CONSTRAINT_ERROR =>
		Put_Line("Argument powinien być liczbą naturalną");
end Zadanie1;
