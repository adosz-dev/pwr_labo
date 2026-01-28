with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Unchecked_Deallocation;

procedure Zadanie1 is
  N: Positive;
  Counter: Natural := 0;
	type Tablica is array(Natural range <>) of Positive;
  type Tablica_Ptr is access Tablica;
  Tab: Tablica_Ptr;
  procedure Free is
    new Standard.Ada.Unchecked_Deallocation(Tablica, Tablica_Ptr);
  procedure Odwroc(Tab: Tablica_Ptr; P: Positive; K: Positive) is
    C: Positive;
    P2: Positive := P;
    K2: Positive := K;
  begin
    while P2 < K2 loop
      C := Tab(P2);
      Tab(P2) := Tab(K2);
      Tab(K2) := C;
      P2 := P2 + 1;
      K2 := K2 -1;
    end loop;
  end Odwroc;
  function Next(Tab: Tablica_Ptr; N: Positive) return Boolean is
    I: Integer := N - 2;
    J: Integer := N - 1;
    C: Positive;
  begin
    while I > 0 and Tab(I)>Tab(I+1) loop
      I := I - 1;
    end loop;
    if I = 0 and Tab(0) > Tab(1) then
      return false;
    end if;
    while (Tab(I)>Tab(J)) loop
      J := J - 1;
    end loop;
    C := Tab(J);
    Tab(J) := Tab(I);
    Tab(I) := C;
    Odwroc(Tab, I+1, N-1);
    return true;
  end Next;
	function Check(Tab: Tablica_Ptr; N: Positive) return Boolean is
    Hetman: Positive;
    Drugi_Hetman: Positive;
  begin
    for I in 0 .. N-2 loop
      Hetman := Tab(I);
      for J in I+1 .. N-1 loop
        Drugi_Hetman := Tab(j);
        if (Hetman = Drugi_Hetman + (j-i)) or (Hetman = Drugi_Hetman - (j-i)) then
          return false;
        end if;
      end loop;
    end loop;
    return true;
  end Check;
  procedure Gen_Tab(Tab: Tablica_Ptr; N: Positive) is
  begin
    for I in 1 .. N loop
      Tab(I-1) := I;
    end loop;
  end Gen_Tab;
begin
  if Argument_Count /= 1 then
    Put_Line("Zła liczba argumentów!");
    return;
  end if;
  N := Positive'Value(Argument(1));
  Tab := new Tablica (0 .. N-1);
  Gen_Tab(Tab, N);
  while Next(Tab, N) loop
    if Check(Tab, N) then
      Put("[");
      for I in 0 .. N-2 loop
        Put(Tab(I)'Image & ", ");
      end loop;
      Put_Line(Tab(N-1)'Image & "]");
      Counter := Counter + 1;
    end if;
  end loop;
  Put_Line("Łącznie rozwiązań:"& Counter'Image);
  Free(Tab);
end Zadanie1;
