package body Totient is
  function Totient(liczba: Natural) return Natural is
    Result : Natural := liczba;
    p : Natural := 2;
    n : Natural := liczba;
  begin
    while p*p <= n loop
      if n mod p = 0 then
        while n mod p = 0 loop
          n := n / p;
        end loop;
        result := result - (result/p);
      end if;
      p := p + 1;
    end loop;

    if n > 1 then
      result := result - (result/n);
    end if;
    return result;
  end Totient;
end Totient;
