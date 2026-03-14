with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure zadanie3a is
   N : Integer;
   D : Integer;
   pierwsza : Integer;
   potega : Integer;
   begin
      pierwsza := 1;
      D := 2;
      Put("Podaj liczbe: ");
      Get(N);
      while D*D <= N loop
         potega := 0;
         while N mod D = 0 loop
            N := N / D;
            potega := potega + 1;
         end loop;
         if potega > 0 then
            if pierwsza = 0 then
            Put("*");
            end if;
            if potega = 1 then
            Put(Integer'Image(D));
            else
            Put(Integer'Image(D) & "^" & Integer'Image(potega));
            end if;
            pierwsza := 0;
         end if;
      D := D + 1;
      end loop;
      if N > 1 then 
         if pierwsza = 0 then
         Put("*");
         end if;
      Put(Integer'Image(N));
      end if;
New_Line;
end zadanie3a;





   

