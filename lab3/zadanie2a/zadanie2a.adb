with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure zadanie2a is
   n: Natural;
   k: Natural;
   function dwumian (n, k : Natural) return Natural is
      type Tablica is array (0 .. n) of Natural;
      C: Tablica := (others => 0);
      i, j: Natural;
      begin
         C(0) := 1;
         for i in 1 .. n loop
            for j in reverse 1 .. i loop
               C(j) := C(j) + C(j - 1);
            end loop;
         end loop;
         return C(k);
      end dwumian;
begin 
      Put_Line("Podaj n");
      Get(n);
      Put_Line("Podaj k");
      Get(k);
      if k > n then
         Put_Line("0");
         return;
      end if;
      Put_Line(Integer'Image(dwumian(n, k)));
end zadanie2a;