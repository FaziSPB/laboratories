with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
procedure zadanie2a is
A : Float;
B : Float;
C : Float;
D : Float;
begin
   Put("Podaj trzy liczby a, b i c: ");
   Get(A); Get(B); Get(C);
   D := B*B - 4.0*A*C;
   if D < 0.0 then
      Put_Line("Brak rozwiazan rzeczywistych");
   elsif D = 0.0 then          
      Put_Line("Jest jedno rozwiazanie rzeczywiste: " & Float'Image(-B/(2.0*A)));
   else
      Put_Line("Sa dwa rozwiazania rzeczywiste: " &
               Float'Image((-B - Sqrt(D)) / (2.0*A)) & " i " &
               Float'Image((-B + Sqrt(D)) / (2.0*A)));
   end if;
end zadanie2a;


