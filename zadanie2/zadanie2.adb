with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure zadanie2 is
	a, b, c, d, x1, x2: Float;
begin
	Put("Podaj liczbę a: ");
	Get(a);
	if a = 0.0 then
		Put_Line("Funkcja nie ma rozwiązania w R");
		return;
	end if;
	Put("Podaj liczbę b: ");
	Get(b);
	Put("Podaj liczbę c: ");
	Get(c);
	
	d := (b**2) - 4.0*a*c;
	if d < 0.0 then
		Put_Line("Funkcja nie ma rozwiązania w R");
	elsif d = 0.0 then
		x1 := (-b)/(2.0*a);
		Put_Line("Funkcja ma jedno rozwiązanie w R:" &x1'Image);
	else
		x1 := (-b - Sqrt(d))/(2.0*a);
		x2 := (-b - Sqrt(d))/(2.0*a);
		Put_Line("Funkcja ma dwa rozwiązania w R:" &x1'Image &", " &x2'Image);
	end if;

end	zadanie2;
