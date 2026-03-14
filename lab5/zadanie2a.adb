with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Main is
   type FuncType is access function (x : Float) return Float;
   function F (x : Float) return Float is
   begin
      return Cos(x / 2.0);
   end F;

   function FindZero (F: FuncType; a_in, b_in, eps : Float) return Float is
      a : Float := a_in;
      b : Float := b_in;
      c : Float := (a + b) / 2.0;
   begin
      while (b - a) > eps loop
         c := (a + b) / 2.0;

         if F(c) = 0.0 then
            return c;
         elsif F(a) * F(c) < 0.0 then
            b := c;
         else
            a := c;
         end if;
      end loop;
      return c;
   end FindZero;

   eps, res : Float;

begin
   for k in 1 .. 8 loop
      eps := 10.0 ** (-k);
      res := FindZero(F'Access, 2.0, 4.0, eps);

      Put("Epsilon: ");
      Put(eps, Exp => 0, Aft => k); 
      Put(", miejsce zerowe: ");
      Put(res, Exp => 0, Aft => 10);
      New_Line;
   end loop;
return;
end Main;

