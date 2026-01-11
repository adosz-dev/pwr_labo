with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Zadanie2 is
	type Func_Ptr is access function (X : Float) return Float;
	function F(X : Float) return Float is
	begin
		return Cos(X / 2.0);
	end F;
	function Find_Zero (Func : Func_Ptr; A_In, B_In, Eps : Float) return Float is
		A : Float := A_In;
		B : Float := B_In;
		C : Float;
	begin
		if abs (B - A) < Eps then
			return (A + B) / 2.0;
		end if;
		while abs (B - A) >= Eps loop
			C := (A + B) / 2.0;
			if Func(C) = 0.0 then
				return C;
			elsif Func(C) * Func(A) < 0.0 then
				B := C;
			else
				A := C;
			end if;
			end loop;
			return (A + B) / 2.0;
	end Find_Zero;
	function Has_Zero (Func : Func_Ptr; A, B : Float) return Boolean is
		begin
			if Func(A) * Func(B) >= 0.0 then
				Put_Line ("W przedziale nie znajduje sie miejsce zerowe!");
				return False;
			end if;
			return True;
	end Has_Zero;
	A, B, K, Eps, Result : Float;
begin
	Put("Podaj a: ");
	Get(A);
	Put("Podaj b: ");
	Get(B);
	Put("epsilon = 10^(-k). Podaj k: ");
	Get(K);
	Eps := 10.0 ** (-K);
	if not Has_Zero(F'Access, A, B) then
		Put_Line("W przedziale nie znajduje się miejsce zerowe!");
		return;
	end if;
	Result := Find_Zero(F'Access, A, B, Eps);
	Put_Line("Wynik: " & Result'Image);
end Zadanie2;
