with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Unchecked_Deallocation;

procedure zadanie3 is
	Liczba: Integer;
  Type Tablica is array (Positive range <>) of Integer;
  Type Tablica_Ptr is access Tablica;
  function Integer_Image(Num: Integer) return String is
    Num_Str: constant String := Trim(Num'Image, Ada.Strings.Left);
  begin
    return Num_Str;
  end Integer_Image;
  procedure Free is
    new Standard.Ada.Unchecked_Deallocation(Tablica, Tablica_Ptr);
  tab: Tablica_Ptr;
  procedure Wypisz(Liczba: Integer; Tab: Tablica_Ptr) is
    Pierwszy: Boolean := True;
  begin
    Put(Integer_Image(Liczba) & "=");
    for I in 2 .. Liczba loop
      if Tab(I)>0 then
        if not Pierwszy then
          Put("*");
        else
          Pierwszy := False;
        end if;
        
        if Tab(I)>1 then
          Put(Integer_Image(I) & "^" & Integer_Image(Tab(I)));
        else
          Put(Integer_Image(I));
        end if;
      end if;
    end loop;
  end Wypisz;
	procedure Rozklad(Liczba: Integer; Tab: Tablica_Ptr) is
    D: Integer := 3;
    DD : Integer := 9;
    N : Integer := Liczba;
  begin
    Tab(2) := 0;
    while n mod 2 = 0 loop
      Tab(2) := Tab(2) + 1;
      N := N / 2; 
    end loop;

    while n >= dd loop
      Tab(d) := 0;
      while n mod d = 0 loop
        N := N / d;
        Tab(d) := Tab(d) + 1;
      end loop;
      dd := dd + 4*d + 4;
      d := d + 2;
    end loop;

    if n > 1 then
      Tab(n) := 1;
    end if;
  end Rozklad;
  begin
    Put("Podaj liczbę: ");
    Get(Liczba);
    Tab := New Tablica(2 .. Liczba);
    for I in 2 .. Liczba loop
      Tab(I) := 0;
    end loop;
    Rozklad(Liczba, Tab);
    Wypisz(Liczba, Tab);
    Free(Tab);
  end zadanie3;
