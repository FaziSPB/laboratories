import math
import sys
def czy_bezpiecznie(tablica, aktualna_kolumna, proponowany_wiersz):
    for i in range(aktualna_kolumna): 
        if tablica[i] == proponowany_wiersz: 
            return False
        if abs(tablica[i] - proponowany_wiersz) == abs(i - aktualna_kolumna): 
            return False
    return True
def rozwiazanie_n_hetmanow(n, kolumna, tablica):
    if kolumna == n: 
        wynik = [x + 1 for x in tablica]
        print(*wynik)
        return
    for wiersz in range(n): 
        if czy_bezpiecznie(tablica, kolumna, wiersz):
            tablica[kolumna] = wiersz
            rozwiazanie_n_hetmanow(n, kolumna + 1, tablica)
def n_hetmanow(n):
    tablica = [0]*n
    return rozwiazanie_n_hetmanow(n, 0, tablica)
if __name__ == "__main__":
    n = int(sys.argv[1])
    n_hetmanow(n)
