with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure zadanie1 is
  a, b, c : Integer;
	function gcd(x, y: Integer) return Integer is
		a, b, c : Integer;
	begin
		a := x;
		b := y;
		while b > 0 loop
			c := a mod b;
			a := b;
			b := c;
		end loop;
		return a;
	end gcd;
begin
  Put("Podaj pierwszą liczbę: ");
  Get(a);
  Put("Podaj drugą liczbę: ");
  Get(b);

	a := gcd(a, b);
  Put_Line("Największy wspólny dzielnik to" & a'Image);
end zadanie1;
