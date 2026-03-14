import totient
import sys
def main():
    if len(sys.argv) < 2:
        print("Uzycie: python3 zadanie2p.py <liczba>")
        sys.exit(1)
    for i in range(1, len(sys.argv)):
        try:
            n = int(sys.argv[i])
            wynik = totient.Totient(n)
            print(f"Totient({n}) = {wynik}")
        except ValueError:
            print(f"Zla wartosc: {sys.argv[i]}")
if __name__ == "__main__":
    main()