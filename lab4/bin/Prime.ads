with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package Prime_lib is
   function Prime(n : Natural) return Natural is
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
   end Prime;
   n_in : Natural;
   Wynik : Natural;
end Prime_lib;