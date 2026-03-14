package Prime_Lib is

   function Is_Prime (N : Integer) return Boolean;
   
   function Prime (N : Natural) return Natural;
   
   function Prime_Numbers (N : Natural) return Natural;
private 
   function Compute_Sieve (N : Natural) return Natural;
   function Count_Primes (Sieve : in out array (Natural range <>) of Boolean; N : Natural) return Natural;

end Prime_Lib;