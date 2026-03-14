with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Mastermind is

   type Kod_T is array (1 .. 4) of Integer;
   type Lista_Wariacji_T is array (1 .. 1296) of Kod_T;

   Wariacje : Lista_Wariacji_T;
   Rozmiar  : Integer := 0;
   Liczba_Poprawnych       : Integer;
   Liczba_Na_Zlym_Miejscu : Integer;
   Propozycja             : Kod_T;

   function Policz_Wystapienia (K : Kod_T; Szukana : Integer) return Integer is
      Ile : Integer := 0;
   begin
      for I in K'Range loop
         if K (I) = Szukana then
            Ile := Ile + 1;
         end if;
      end loop;
      return Ile;
   end Policz_Wystapienia;
   function Min (A, B : Integer) return Integer is
   begin
      if A < B then return A; else return B; end if;
   end Min;
   procedure Sprawdz (Kod1 : Kod_T; Kod2 : Kod_T; Zle_Out : out Integer; Dobre_Out : out Integer) is
      Dobre         : Integer := 0;
      Zle           : Integer := 0;
      Wspolne_Cyfry : Integer := 0;
      Ile_Kod1      : Integer;
      Ile_Kod2      : Integer;
   begin
      for I in 1 .. 4 loop
         if Kod1 (I) = Kod2 (I) then
            Dobre := Dobre + 1;
         end if;
      end loop;
      for Cyfra in 1 .. 6 loop
         Ile_Kod1 := Policz_Wystapienia (Kod1, Cyfra);
         Ile_Kod2 := Policz_Wystapienia (Kod2, Cyfra);
         
         Wspolne_Cyfry := Wspolne_Cyfry + Min (Ile_Kod1, Ile_Kod2);
      end loop;
      Zle := Wspolne_Cyfry - Dobre;

      Zle_Out   := Zle;
      Dobre_Out := Dobre;
   end Sprawdz;

begin
   for I in 1 .. 6 loop
      for J in 1 .. 6 loop
         for K in 1 .. 6 loop
            for L in 1 .. 6 loop
               Rozmiar := Rozmiar + 1;
               Wariacje (Rozmiar) := (I, J, K, L);
            end loop;
         end loop;
      end loop;
   end loop;

   loop
      if Rozmiar = 0 then
         Put_Line ("Oszukujesz!");
         exit;
      end if;
      Propozycja := Wariacje (1);

      for I in 1 .. 4 loop
         Put (Propozycja (I), Width => 1);
         Put (" ");
      end loop;
      Put_Line ("?");

      Put ("Na swoim miejscu: ");
      Get (Liczba_Poprawnych);

      if Liczba_Poprawnych = 4 then
         Put_Line ("Zgadlem!");
         exit;
      end if;

      Put ("Nie na swoim miejscu: ");
      Get (Liczba_Na_Zlym_Miejscu);
      
      declare
         Nowe_Wariacje : Lista_Wariacji_T; 
         Nowy_Rozmiar  : Integer := 0;
         Zle, Dobre : Integer;
         Kandydat      : Kod_T;
      begin
         for I in 1 .. Rozmiar loop
            Kandydat := Wariacje (I);
            Sprawdz (Kandydat, Propozycja, Zle, Dobre);

            if Zle = Liczba_Na_Zlym_Miejscu and Dobre = Liczba_Poprawnych then
               Nowy_Rozmiar := Nowy_Rozmiar + 1;
               Nowe_Wariacje (Nowy_Rozmiar) := Kandydat;
            end if;
         end loop;
         Wariacje := Nowe_Wariacje;
         Rozmiar  := Nowy_Rozmiar;
      end;
   end loop;

end Mastermind;