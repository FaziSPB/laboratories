def main():
    a = int(input("pierwsza liczba calkowita: "))
    b = int(input("druga liczba calkowita: "))
    def gcd(a,b):
        while b != 0:
            a, b = b, a % b
        return a
    print("Najwiekszy wspolny dzielnik to:", gcd(a,b))
if __name__ == "__main__":
    main()
    