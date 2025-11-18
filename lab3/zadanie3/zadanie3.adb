with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

procedure Zadanie3 is
	type Pierwsze is array (Natural range <>) of Integer;
	type Pierwsze_Ptr is access Pierwsze;
	pierw : Pierwsze_Ptr;
	n: Integer;
	procedure Free is
		new Standard.Ada.Unchecked_Deallocation(Pierwsze, Pierwsze_Ptr);
	function czy_pierwsza(pierw: Pierwsze_Ptr; kandydat: Integer; c: Integer) return Boolean is
	begin
		for i in 1..c loop
			if pierw(i)*pierw(i) > kandydat then
				return True;
			end if;
			if kandydat mod pierw(i) = 0 then
				return False;
			end if;
		end loop;
		return True;
	end czy_pierwsza;
	procedure znajdz_pierwsza(pierw: Pierwsze_Ptr; n: Integer) is
		c: Integer := 2;
		kandydat: Integer := 3;
	begin
		pierw(1) := 2;
		while c<=n loop
			if czy_pierwsza(pierw, kandydat, c) then
				pierw(c) := kandydat;
				c := c + 1;
			end if;
			kandydat := kandydat + 2;
		end loop;
		Put_Line(pierw(n)'Image);
	end znajdz_pierwsza;
begin
	Put("Podaj liczbe n: ");
	Get(n);
	pierw := new Pierwsze(1 .. n);
	znajdz_pierwsza(pierw, n);
  Free(pierw);
end Zadanie3;
