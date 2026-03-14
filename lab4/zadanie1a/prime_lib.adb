with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Prime_Lib is

   function Is_Prime (N : Integer) return Boolean is
      A : Integer := N; 
      I : Integer;
   begin
      if N <= 1 then
         return False;
      end if;
      if N = 2 then
         return True;
      end if;
      if N mod 2 = 0 then
         return False;
      end if;
      
      I := 3;
      while A >= I * I loop
         if A mod I = 0 then
            return False;
         end if;
         I := I + 2;
      end loop;
      
      return True;
   end Is_Prime;

   function Prime (N : Natural) return Natural is
      Pierwsze : array (1 .. N) of Natural;
      Liczba   : Natural := 2;
      C        : Natural := 0;
      I        : Natural; 
   begin
      if N <= 0 then 
         return 0;
      end if;
      
      while C < N loop
         declare
            Jest_Pierwsza : Boolean := True;
            P : Natural;
         begin
            for K in 1 .. C loop 
               P := Pierwsze(K);
               if P * P > Liczba then
                  exit;
               end if;
               if Liczba mod P = 0 then
                  Jest_Pierwsza := False;
                  exit;
               end if;   
            end loop;

            if Jest_Pierwsza then
               C := C + 1;
               Pierwsze(C) := Liczba;
            end if;
         end; 
         Liczba := Liczba + 1;
      end loop;
      
      return Pierwsze(N);
   end Prime;

   function Prime_Numbers (N : Natural) return Natural is
      type Sieve is array (2 .. N) of Boolean;
      S : Sieve;

      procedure Compute_Sieve (S_Arr : in out Sieve) is
         J : Natural;
         Limit : Integer;
      begin
         for I in S_Arr'Range loop
            S_Arr(I) := True;
         end loop;

         Limit := Integer(Sqrt(Float(N)));

         for I in S_Arr'First .. Limit loop
            if S_Arr(I) then
               J := I * I;
               while J <= N loop
                  S_Arr(J) := False;
                  J := J + I;
               end loop;
            end if;
         end loop;
      end Compute_Sieve;
      function Count_Primes (S_Arr : Sieve) return Natural is
         Count : Natural := 0;
      begin
         for I in S_Arr'First .. S_Arr'Last loop
            if S_Arr(I) then
               Count := Count + 1;
            end if;
         end loop;
         return Count;
      end Count_Primes;

   begin
      if N < 2 then
         return 0;
      end if;
      
      Compute_Sieve(S);
      return Count_Primes(S);
   end Prime_Numbers;

end Prime_Lib;