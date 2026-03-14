with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics ; use Ada.Numerics;


package Prime_lib is
   N : Integer;
   function is_Prime(N: in Integer) return Boolean is
   a, i : Integer;
   begin
      a := N;
      if n <= 1 then
         return False;
      end if;
      if n = 2 then
         return True;
      end if;
      if n mod 2 = 0 then
         return False;
      end if;
      i := 3;
      while a >= i*i loop
         if a mod i = 0 then
            return False;
         end if;
         i := i + 2;
      end loop;
      return True;
   end is_Prime;
   function Prime(n : Natural) return Natural is
      pierwsze : array (1 .. n) of Natural;
      liczba: Natural := 2;
      c: Natural := 0;
      begin
      if n <= 0 then 
         return 0;
      end if;
      while c < n loop
         declare
            pierwsza: Boolean := True;
         begin
            for i in 1 .. c-1 loop
               declare
                  p : Natural := pierwsze(i);
               begin
                  if p * p > liczba then
                     exit;
                  end if;
                  if liczba mod p = 0 then
                     pierwsza := False;
                     exit;
                  end if;   
               end;
            end loop;
            if pierwsza then
               c := c + 1;
               pierwsze(c) := liczba;
            end if;
         end; 
         liczba := liczba + 1;
      end loop;
      return pierwsze(n);
   end Prime;
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
end Prime_lib;