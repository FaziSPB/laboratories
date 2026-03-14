with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics ; use Ada.Numerics;


procedure zadanie2a is
   N : Integer;
   function is_Prime(N: in Integer) return Boolean is
   a, i : Integer;
   begin
      a := N;
      if n <= 1 then
         return False;
      end if;
      if n = 2 then
         return True;
      end if;
      if n mod 2 = 0 then
         return False;
      end if;
      i := 3;
      while a >= i*i loop
         if a mod i = 0 then
            return False;
         end if;
         i := i + 2;
      end loop;
      return True;
   end is_Prime;
   begin
   Put("Podaj liczbe: "); 
   Get(N);
   if is_Prime(N) then
      Put_Line("Liczba " & Integer'Image(N) & " jest pierwsza.");
   else
      Put_Line("Liczba " & Integer'Image(N) & " nie jest pierwsza.");
   end if;
end zadanie2a; 


      