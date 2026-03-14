import sys
def hetmani(n):
    tablica = [0] * (n + 1)
    bije_wiersz = [False] * (n + 1)
    bije_przek1 = [False] * (2 * n + 1) 
    bije_przek2 = [False] * (2 * n + 1)
    def ustaw(i):
        for j in range(1, n + 1):
            if not bije_wiersz[j] and not bije_przek1[i + j] and not bije_przek2[i - j + n]:
                tablica[i] = j
                bije_wiersz[j] = True
                bije_przek1[i + j] = True   
                bije_przek2[i - j + n] = True
                if i < n:
                    ustaw(i + 1)
                else:
                    print(*tablica[1:])
                tablica[i] = 0
                bije_wiersz[j] = False
                bije_przek1[i + j] = False
                bije_przek2[i - j + n] = False
    ustaw(1)
if __name__ == "__main__":
    import sys
    n = int(sys.argv[1])
    hetmani(n)
