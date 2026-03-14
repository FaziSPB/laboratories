with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure zadanie1a is
   A : Integer;
   B : Integer;
   Temp : Integer;
begin
   Put("Podaj dwie liczby calkowite: ");
   Get(A); Get(B);
   while B /= 0 loop
      Temp := B;
      B := A mod B;
      A := Temp;
   end loop;
   Put_Line("NWD podanych liczb to: " & Integer'Image(A));
end zadanie1a;
