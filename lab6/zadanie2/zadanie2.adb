with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with Ada.Command_Line; use Ada.Command_Line;

procedure Zadanie2 is
	type Tablica is array(Integer range <>) of Boolean;
	type Tablica_Ptr is access Tablica;
	type Tablica_Liczb is array(Integer range <>) of Integer;
	type Tablica_Liczb_Ptr is access Tablica_Liczb;
	procedure Free_Tab is
		new Standard.Ada.Unchecked_Deallocation(Tablica, Tablica_Ptr);
	procedure Free_Tab_L is
		new Standard.Ada.Unchecked_Deallocation(Tablica_Liczb, Tablica_Liczb_Ptr);
	Position: Tablica_Liczb_Ptr;
	Bije_Wiersz: Tablica_Ptr;
	Bije_Przek1: Tablica_Ptr;
	Bije_Przek2: Tablica_Ptr;
	N: Positive;
	Counter: Natural;
	procedure Ustaw(I: Integer) is
	begin
		for J in 1 .. N loop
			if not (Bije_Wiersz(J) or Bije_Przek1(I+J) or Bije_Przek2(I-J)) then
				Position(I) := J;
				Bije_Wiersz(J) := true;
				Bije_Przek1(I+J) := true;
				Bije_Przek2(I-J) := true;
				if I<N then
					Ustaw(I+1);
				else
					Counter := Counter +1;
					Put("[");
					for I in 1 .. N-1 loop
						Put(Position(I)'Image & ", ");
					end loop;
					Put_Line(Position(N)'Image & "]");
				end if;
				Position(I) := 0;
				Bije_Wiersz(J) := false;
				Bije_Przek1(I+J) := false;
				Bije_Przek2(I-J) := false;
			end if;
		end loop;
	end Ustaw;
begin
	if Argument_Count /= 1 then
    Put_Line("Zła liczba argumentów!");
    return;
  end if;
  N := Positive'Value(Argument(1));
	Counter := 0;
	Position := new Tablica_Liczb(1 .. N);
	Bije_Wiersz := new Tablica(1 .. N);
	Bije_Przek1 := new Tablica(2 .. 2*N);
	Bije_Przek2 := new Tablica(-N +1 .. N-1);
	Ustaw(1);
	Put_Line("Łącznie rozwiązań: "&Counter'Image);
	Free_Tab_L(Position);
	Free_Tab(Bije_Przek1);
	Free_Tab(Bije_Przek2);
	Free_Tab(Bije_Wiersz);
end Zadanie2;
