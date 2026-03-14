with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line;

procedure Hetmani is
   N : Integer;
begin
   if Ada.Command_Line.Argument_Count < 1 then
      return;
   end if;

   N := Integer'Value(Ada.Command_Line.Argument(1));

   declare
      Tablica : array (1 .. N) of Integer;
      Bije_Wiersz : array (1 .. N) of Boolean := (others => False);
      Bije_Przek1 : array (1 .. 2 * N) of Boolean := (others => False);
      Bije_Przek2 : array (1 .. 2 * N) of Boolean := (others => False);

      procedure Ustaw (I : Integer) is
      begin
         for J in 1 .. N loop
            if not Bije_Wiersz(J) 
               and then not Bije_Przek1(I + J) 
               and then not Bije_Przek2(I - J + N) 
            then
               Tablica(I) := J;
               Bije_Wiersz(J) := True;
               Bije_Przek1(I + J) := True;
               Bije_Przek2(I - J + N) := True;

               if I < N then
                  Ustaw(I + 1);
               else
                  for K in 1 .. N loop
                     Put(Item => Tablica(K), Width => 0);
                     if K < N then
                        Put(" ");
                     end if;
                  end loop;
                  New_Line;
               end if;

               Bije_Wiersz(J) := False;
               Bije_Przek1(I + J) := False;
               Bije_Przek2(I - J + N) := False;
            end if;
         end loop;
      end Ustaw;

   begin
      Ustaw(1);
   end;
end Hetmani;