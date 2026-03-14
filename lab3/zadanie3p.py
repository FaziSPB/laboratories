def znajdz(n):
    if n <= 0:
        return 0
    pierwsze = []
    liczba = 2
    while len(pierwsze) < n:
        pierwsza = True
        for p in pierwsze:
            if p * p > liczba:
                break
            if liczba % p == 0:
                pierwsza = False
                break
        if pierwsza:
            pierwsze.append(liczba)
        liczba += 1
    return pierwsze[-1]
def main():
    n = int(input("n: "))
    print(znajdz(n))
if __name__ == "__main__":
    main()