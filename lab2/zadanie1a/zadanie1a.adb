
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure zadanie1a is
   A, B, Temp : Integer;
   function gcd(X: in Integer; Y: in Integer) return Integer is 
      A, B, Temp : Integer;
   begin 
      A := X;
      B := Y;
      while B /= 0 loop
         Temp := B;
         B := A mod B;
         A := Temp;   
      end loop;
      return A;
   end gcd;
begin
   Put("Podaj pierwsza liczbe: ");
   Get(A);
   Put("Podaj druga liczbe: ");
   Get(B);
   Temp := gcd(A, B);
   Put_Line("NWD wynosi: " & Integer'Image(Temp));
end zadanie1a;