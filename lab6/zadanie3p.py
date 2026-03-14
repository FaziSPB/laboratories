import itertools 

wariacje = list(itertools.product(range(1, 7), repeat=4))
def sprawdz(kod1, kod2):
    dobre = 0
    for i in range(4):
        if kod1[i] == kod2[i]:
            dobre += 1
    wspolne_cyfry = 0
    for cyfra in range(1, 7): 
        ile_w_kodzie1 = kod1.count(cyfra)
        ile_w_kodzie2 = kod2.count(cyfra)
        wspolne_cyfry += min(ile_w_kodzie1, ile_w_kodzie2)
    zle = wspolne_cyfry - dobre
    
    return zle, dobre
def mastermind(wariacje, liczba_poprawnych = 0,liczba_na_zlym_miejscu = 0):
    while True:
        propozycja = wariacje[0]
        print(propozycja, " ?")
        liczba_poprawnych = int(input("Na swoim miejscu: "))
        if liczba_poprawnych == 4:
            print("Zgadlem!")
            break
        liczba_na_zlym_miejscu = int(input("Nie na swoim miejscu: "))
        nowe_wariacje = []
        for wariacja in wariacje:
            zle, dobre = sprawdz(wariacja, propozycja)
            if zle == liczba_na_zlym_miejscu and dobre == liczba_poprawnych:
                nowe_wariacje.append(wariacja)
        wariacje = nowe_wariacje
        if not wariacje:
            print("Oszukujesz!")
            break
if __name__ == "__main__":
    mastermind(wariacje)