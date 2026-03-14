with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Totient is

function Totient(n : Natural) return Natural is
  Wynik : Positive := N;
  a : Positive := N;
  potega: Integer := 0;
  begin 
      while a mod 2 = 0 loop
         potega := potega +1;
         a := a / 2;
      end loop;

      if potega > 0 then
         wynik := wynik / 2;
      end if; 

      declare
         d : Integer := 3;
      begin
         while d * d <= a loop
            potega := 0;
            while a mod d = 0 loop
               potega := potega + 1;
               a := a / d;
            end loop;
         if potega > 0 then
            wynik := (wynik / d) * (d-1);
         end if;
         d := d + 2;
         end loop;
      end;
      if a > 2 then  
         wynik := (wynik / a) * (a-1);
      end if;

      return Wynik;
   end Totient;
         
end Totient;
