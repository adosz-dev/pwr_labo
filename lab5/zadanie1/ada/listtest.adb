with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

with List; use List;

procedure listTest is
  l : List.ListT;
  r, e : Integer;
  command : Unbounded_String;
  continue : Boolean := True;
begin
  while continue loop
    Put("Command: ");
    Get_Line(command);
    if command = "Pop" then
      if not isEmpty(l) then
        r := List.Pop(l);
        Put_Line("Result: " & r'Image);
      else
        Put_Line("Error - stack is empty!");
      end if;
    elsif command = "Clean" then
      List.Clean(l);
      Put_Line("Result: OK");
    elsif command = "Push" then
      Put("Value: ");
      Get(r);
      Skip_Line;
      List.Push(l, r);
      Put_Line("Result: OK");
    elsif command = "Insert" then
      Put("Value i: ");
      Get(r);
      Skip_Line;
      Put("Value e: ");
      Get(e);
      Skip_Line;
      if ((not List.isEmpty(l)) and (length(l)+1>=r)) or (List.isEmpty(l) and r=1) then
        List.Insert(l, r, e);
        Put_Line("Result: OK");
      else
        Put_Line("Error - Element Doesn't Exist!");
      end if;
    elsif command = "Delete" then
      Put("Value: ");
      Get(r);
      Skip_Line;
      if (not List.isEmpty(l)) and (length(l)>=r) then
        List.Delete(l, r);
        Put_Line("Result: OK");
      else
        Put_Line("Error - Element Doesn't Exist!");
      end if;
    elsif command = "Append" then
      Put("Value: ");
      Get(r);
      Skip_Line;
      List.Append(l, r);
      Put_Line("Result : OK");
    elsif command = "Print" then
      Put("Result: ");
      List.Print(l);
    elsif command = "Length" then
      r := Length(l);
      Put_Line("Result: " & r'Image);
    elsif command = "Exit" then
      continue := False;
    elsif command = "Get" then
      Put("Value: ");
      Get(r);
      Skip_Line;
      Put_Line(List.Get(l, r)'Image);
    else
      Put_Line("Unknown command!");
    end if;
  end loop;
  List.Clean(l);
end listTest;
