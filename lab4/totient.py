import math

def Totient(n):
    d = 2
    a = n
    wynik = n
    while d * d <= a:
        potega = 0
        while a % d == 0:
            a //= d
            potega += 1
        if potega > 0:
            wynik *= (d-1)
            wynik //= d
        d += 1
    return wynik