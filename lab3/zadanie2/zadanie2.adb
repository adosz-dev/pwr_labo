with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

procedure Zadanie2 is
	n, k : Integer;
	procedure Dwumian(n,k :Integer) is
		type Tab is array (Natural range <>) of Integer; 
		type Tab_Ptr is access Tab;
		t : Tab_Ptr;
		m, j : Integer;
		procedure Free is
			new Standard.Ada.Unchecked_Deallocation(Tab, Tab_Ptr);
		begin
			t := new Tab (0 .. n);  
			t(0) := 1;
			for i in 1 .. n loop
				if i <= k then
					t(i) := 1;
				end if;
				if i-1 < k then
					m := i-1;
				else
					m := k;
				end if;
				for j in reverse 1 .. m loop
					t(j) := t(j) + t(j-1);
				end loop;
			end loop;
			Put_Line(t(k)'Image);
			Free(t);
	end Dwumian;
	begin
		Put("Podaj liczbe n: ");
		Get(n);
		Put("Podaj liczbe k: ");
		Get(k);
		if k > n-k then
			k := n-k;
		end if;
		Dwumian(n, k);
end Zadanie2;

