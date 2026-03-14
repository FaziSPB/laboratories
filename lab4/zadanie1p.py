import sys
import prime_lib

def main():
    if len(sys.argv) != 3:
        print("Uzycie: python program.py <komenda> <liczba>")
        return
    komenda = sys.argv[1]
    try:
        n = int(sys.argv[2])
    except ValueError:
        print("Zla wartosc")
        return
    if komenda == "pn":
        wynik = prime_lib.PrimeNumbers(n)
        print(wynik)
        
    elif komenda == "pr":
        wynik = prime_lib.Prime(n)
        print(wynik)
        
    elif komenda == "ip":
        wynik = prime_lib.IsPrime(n)
        print(wynik)
        
    else:
        print(f"Nieznana komenda: {komenda}")

if __name__ == "__main__":
    main()