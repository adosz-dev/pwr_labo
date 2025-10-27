with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure zadanie2 is 
	Liczba : Integer;
	function Czy_Pierwsza(Liczba : Integer) return Boolean is 
		Pierwiastek: Integer;
		I: Integer := 3;
	begin
		if Liczba <= 1 then
			return False;
		elsif Liczba = 2 then
			return True;
		elsif Liczba mod 2 = 0 then
			return False;
		else
			Pierwiastek := Integer(Sqrt(Float(Liczba)))+1;
			while I < Pierwiastek loop
				if Liczba mod I = 0 then
					return False;
				end if;
				I := I+2;
			end loop;
		end if;
		return True;
	end Czy_Pierwsza;
begin
	Put("Podaj liczbę: ");
	Get(Liczba);
	if Czy_Pierwsza(Liczba) then
		Put_Line("Liczba jest pierwsza");
	else
		Put_Line("Liczba nie jest pierwsza");
	end if;
end zadanie2;
