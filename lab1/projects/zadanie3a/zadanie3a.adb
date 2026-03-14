
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions;

procedure Zadanie3a is
   use Ada.Text_IO;
   use Ada.Integer_Text_IO;
   use Ada.Numerics.Elementary_Functions;
   N, Oryginal_N: Integer;
   M : Integer := 0;
   P : Integer; 
begin
   Put("Podaj liczbe N: ");
   Get(N);
   Put("Podaj liczbe P: ");
   Get(P);
   Oryginal_N := N;
   while N > 0 and P >= 2 loop
      M := M*P + (N mod P);
      N := N / P;
   end loop;  
   if M = Oryginal_N then
      Put_Line("TAK, jest palindromem w systemie o podstawie " & Integer'Image(P));
   else
      Put_Line("NIE, nie jest palindromem w systemie o podstawie " & Integer'Image(P));
   end if;
end Zadanie3a;