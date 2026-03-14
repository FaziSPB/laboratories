with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.IO_Exceptions; use Ada.IO_Exceptions;
package Prime_lib is
   function PrimeNumbers (n : Natural) return Natural is
      type Sieve is array (2 .. n) of Boolean;
      procedure Compute_Sieve (s : in out Sieve) is
         j: Natural;
      begin
         for i in s'Range loop
            s(i) := True;
         end loop;
         for i in s'First .. Integer(Sqrt(Float(n))) loop
            if s(i) then
               j := i * i;
               while j <= n loop
                  s(j) := False;
                  j := j + i;
               end loop;
            end if;
         end loop;
      end Compute_Sieve;
      function Count_Primes (s : Sieve) return Natural is
         c: Natural := 0;
      begin
         for i in s'First .. s'Last loop
            if s(i) then
               c := c + 1;
            end if;
         end loop;
         return c;
      end Count_Primes;

      s: Sieve;
   begin
      Compute_Sieve(s);
      return Count_Primes(s);
   end PrimeNumbers;

   n: Natural;
end Prime_lib;