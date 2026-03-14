a = int(input("Podaj liczbe: "))
d = 2
wynik = ""
while d * d <= a:
    potega = 0
    while a % d == 0:
        a //= d
        potega += 1
    if potega > 0:
        if wynik != "":
            wynik += " * "
        if potega == 1:
            wynik += str(d)
        else:
            wynik += str(d) + "^" + str(potega)
    d += 1

if a > 1:
    if wynik != "":
        wynik += " * "
    wynik += str(a)
print("Rozklad na czynniki pierwsze:", wynik)