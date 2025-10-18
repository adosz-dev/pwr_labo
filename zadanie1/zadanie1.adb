with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure zadanie1 is
  a, b, c : Integer;
begin
  Put("Podaj pierwszą liczbę: ");
  Get(a);
  Put("Podaj drugą liczbę: ");
  Get(b);
  while b > 0 loop
    c := a mod b;
    a := b;
    b := c;
  end loop;
  Put_Line("Największy wspólny dzielnik to" & a'Image);
end zadanie1;
