with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure zadanie3a is
   function znajdz(n : Natural) return Natural is
      pierwsze : array (1 .. n) of Natural;
      liczba: Natural := 2;
      c: Natural := 0;

      begin
      if n <= 0 then 
         return 0;
      end if;
      while c < n loop
         declare
            pierwsza: Boolean := True;
         begin
            for i in 1 .. c-1 loop
               declare
                  p : Natural := pierwsze(i);
               begin
                  if p * p > liczba then
                     exit;
                  end if;
                  if liczba mod p = 0 then
                     pierwsza := False;
                     exit;
                  end if;   
               end;
            end loop;
            if pierwsza then
               c := c + 1;
               pierwsze(c) := liczba;
            end if;
         end; 
         liczba := liczba + 1;
      end loop;
      return pierwsze(n);
   end znajdz;
   n_in : Natural;
   Wynik : Natural;
begin
   Put_Line("Podaj n");
   Get(n_in);
   Wynik := znajdz(n_in);
   Put_Line("Wynik: " & Natural'Image(Wynik));
end zadanie3a;