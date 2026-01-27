with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Zadanie3 is
	type Komb_Array is array (0 .. 6*6*6*6, 1 .. 4) of Integer;
	type Kod_Array is array (1 .. 4) of Integer;
	Rozmiar: Natural := 6*6*6*6;
	Rozmiar2: Natural;
	Kombinacje: Komb_Array;
	Pytanie: Kod_Array;
	Kod: Kod_Array;
	Na_Miejscu: Integer;
	Nie_Na_Miejscu: Integer;
	procedure Gen_Tab(Kombinacje: out Komb_Array) is
		I: Natural := 0;
	begin
		for A in 1 .. 6 loop
			for B in 1 .. 6 loop
				for C in 1 .. 6 loop
					For D in 1 .. 6 loop
						Kombinacje(I, 1) := A;
						Kombinacje(I, 2) := B;
						Kombinacje(I, 3) := C;
						Kombinacje(I, 4) := D;
						I := I + 1;
					end loop;
				end loop;
			end loop;
		end loop;
	end Gen_Tab;
	function Poprawny(Pytanie: Kod_Array; Kod: Kod_Array; Na_Miejscu: Natural; Nie_Na_Miejscu: Natural) return Boolean is
		Pytanie2: Kod_Array := Pytanie;
		Kod2: Kod_Array := Kod;
		NM_Kod: Natural := 0;
		NNM_Kod: Natural := 0;
	begin
		for I in 1 .. 4 loop
			if Pytanie2(I) = Kod2(I) then
				Pytanie2(I) := -1;
				Kod2(I) := -1;
				NM_Kod := NM_Kod + 1;
			end if;
		end loop;

		for I in 1 .. 4 loop
			if Pytanie2(I) /= -1 then
				for J in 1 .. 4 loop
					if Kod2(J) = Pytanie2(I) then
						NNM_Kod := NNM_Kod + 1;
						Kod2(J) := -1;
						exit;
					end if;
				end loop;
			end if;
		end loop;
		return (NNM_Kod = Nie_Na_Miejscu and NM_Kod = Na_Miejscu);
	end Poprawny;
begin
	Gen_Tab(Kombinacje);
	while Rozmiar > 1 loop
		for I in 1 .. 4 loop
			Pytanie(I) := Kombinacje(0, I);
		end loop;
		Put_Line(Pytanie(1)'Image & Pytanie(2)'Image 
						& Pytanie(3)'Image & Pytanie(4)'Image &"?");
		Put("Liczba cyfr na swoim miejscu: ");
		Get(Na_Miejscu);
		Put("Liczba cyfr nie na swoim miejscu: ");
		Get(Nie_Na_Miejscu);
		Rozmiar2 := 0;
		for I in 1 .. Rozmiar-1 loop
			for K in 1 .. 4 loop
				Kod(K) := Kombinacje(I, K);
			end loop;
			if Poprawny(Pytanie, Kod, Na_Miejscu, Nie_Na_Miejscu) then
				for J in 1 .. 4 loop
					Kombinacje(Rozmiar2, j) := Kombinacje(i, j);
				end loop;
				Rozmiar2 := Rozmiar2 + 1;
			end if;
		end loop;
		Rozmiar := Rozmiar2;
	end loop;
	if Rozmiar = 0 then
		Put_Line("Oszukujesz!");
	else
		Put_Line("Wygrałem!");
	end if;
end Zadanie3;
