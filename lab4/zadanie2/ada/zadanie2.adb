with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Totient;

procedure zadanie2 is
	Result, N : Natural;
begin
  if Argument_Count < 1 then
    Put_Line("Podaj parametry!");
  end if;
  for I in 1 .. Argument_Count loop
    N := Natural'Value(Argument(I));
    Result := Totient.Totient(N);
    Put_Line("totient("& N'Image & ")=" &Result'Image);
  end loop;
end zadanie2;
