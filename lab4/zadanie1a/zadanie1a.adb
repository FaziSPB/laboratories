with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.IO_Exceptions; use Ada.IO_Exceptions;
with Prime_lib; use Prime_lib;
with Ada.Command_Line; use Ada.Command_Line;
procedure zadanie1a is
   N : Natural := 0;
begin
   if Argument_Count < 2 then
      Put_Line("Uzycie: <komenda> <liczba>");
      return;
   end if;

   if Argument(1)'Length /= 2 then
      return;
   end if;
   begin
      N := Natural'Value(Argument(2));
   exception
      when Constraint_Error =>
         Put_Line("Zla wartosc");
         return;
   end;

   if Argument(1) = "pn" then
      Put_Line(Natural'Image(Prime_Numbers(N)));
   elsif Argument(1) = "pr" then
      Put_Line(Natural'Image(Prime(N)));
   elsif Argument(1) = "ip" then
      Put_Line(Boolean'Image(is_Prime(Integer(N))));
   end if;
end zadanie1a;
   