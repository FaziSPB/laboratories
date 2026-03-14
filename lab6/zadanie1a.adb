with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line;

procedure Hetmani is
   N : Integer;
begin
   N := Integer'Value(Ada.Command_Line.Argument(1));

   declare
      Tablica : array (0 .. N - 1) of Integer;

      function Czy_Bezpiecznie(Kolumna, Wiersz : Integer) return Boolean is
      begin
         for I in 0 .. Kolumna - 1 loop
            if Tablica(I) = Wiersz then
               return False;
            end if;
            if abs(Tablica(I) - Wiersz) = abs(I - Kolumna) then
               return False;
            end if;
         end loop;
         return True;
      end Czy_Bezpiecznie;

      procedure Rozwiazanie(Kolumna : Integer) is
      begin
         if Kolumna = N then
            for I in 0 .. N - 1 loop
               Put(Item => Tablica(I) + 1, Width => 0);
               if I < N - 1 then
                  Put(" ");
               end if;
            end loop;
            New_Line;
            return;
         end if;

         for Wiersz in 0 .. N - 1 loop
            if Czy_Bezpiecznie(Kolumna, Wiersz) then
               Tablica(Kolumna) := Wiersz;
               Rozwiazanie(Kolumna + 1);
            end if;
         end loop;
      end Rozwiazanie;

   begin
      Rozwiazanie(0);
   end;
end Hetmani;