with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.IO_Exceptions; use Ada.IO_Exceptions;
with Totient;
with Ada.Command_Line; use Ada.Command_Line;

procedure zadanie2a is 
   N : Natural;
begin
   if Argument_Count < 1 then
      Put_Line("Uzycie: <liczba>");
      return;
   end if;
   begin
      for i in 1 .. Argument_Count loop
         N := Natural'Value(Argument(i));
         Put_Line("totient(" & Natural'Image(N) & ") = " & Natural'Image(Totient.Totient(N)));
      end loop;
   exception
      when Constraint_Error =>
         Put_Line("Zla wartosc");
         return;
   end;
end zadanie2a;