with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Prime_Numbers; use Prime_Numbers;

Procedure Zadanie1 is
	N : Positive;
	result : Natural;
begin
	if Argument_Count /= 2 then
		Put_Line("Zła liczba parametrów");
		return;
	end if;
	N := Positive'Value(Argument(2));
  if Argument(1) = "pn" then
    result := Prime_Numbers.PrimeNumbers(N);
    Put_Line(result'Image);
  elsif Argument(1) = "ip" then
    Put_Line(IsPrime(N)'Image);
  elsif Argument(1) = "pr" then
		Put_Line(Prime(N)'Image);
  else
    Put_Line("Błędny parametr!");
  end if;
exception
	when CONSTRAINT_ERROR =>
		Put_Line("Drugi parametr powinien być liczbą naturalną");
end Zadanie1;
