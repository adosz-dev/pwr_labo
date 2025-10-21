with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure zadanie3 is
	n, p, m, a: Integer;
begin
	Put("Podaj liczbę n:");
	Get(n);
	Put("Podaj liczbę p (p>=2):");
	Get(p);

	m := 0;
	a := n;
	while a>0 loop
		m := m*p + a mod p;
		a := a/p;
	end loop;
	
	Put("Liczba"&n'Image &" o podstawie" & p'Image);
	if n=m then
		Put_Line(" jest palindromem");
	else
		Put_Line(" nie jest palindromem");
	end if;
end zadanie3;
