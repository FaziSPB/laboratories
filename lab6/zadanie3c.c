#include <stdio.h>

typedef struct {
    int cyfry[4];
} Kod;
int policz_wystapienia(Kod k, int szukana_cyfra) {
    int licznik = 0;
    for (int i = 0; i < 4; i++) {
        if (k.cyfry[i] == szukana_cyfra) {
            licznik++;
        }
    }
    return licznik;
}
int min(int a, int b) {
    return (a < b) ? a : b;
}
void sprawdz(Kod kod1, Kod kod2, int *zle_out, int *dobre_out) {
    int dobre = 0;
    int zle = 0;
    for (int i = 0; i < 4; i++) {
        if (kod1.cyfry[i] == kod2.cyfry[i]) {
            dobre++;
        }
    }
    int wspolne_cyfry = 0;
    for (int cyfra = 1; cyfra <= 6; cyfra++) {
        int ile_w_kodzie1 = policz_wystapienia(kod1, cyfra);
        int ile_w_kodzie2 = policz_wystapienia(kod2, cyfra);
        
        wspolne_cyfry += min(ile_w_kodzie1, ile_w_kodzie2);
    }
    zle = wspolne_cyfry - dobre;
    *zle_out = zle;
    *dobre_out = dobre;
}

int main() {
    Kod wariacje[1296];
    int rozmiar = 0;

    for (int i = 1; i <= 6; i++) {
        for (int j = 1; j <= 6; j++) {
            for (int k = 1; k <= 6; k++) {
                for (int l = 1; l <= 6; l++) {
                    wariacje[rozmiar].cyfry[0] = i;
                    wariacje[rozmiar].cyfry[1] = j;
                    wariacje[rozmiar].cyfry[2] = k;
                    wariacje[rozmiar].cyfry[3] = l;
                    rozmiar++;
                }
            }
        }
    }

    int liczba_poprawnych = 0;
    int liczba_na_zlym_miejscu = 0;

    while (1) {
        if (rozmiar == 0) {
            printf("Oszukujesz!\n");
            break;
        }
        Kod propozycja = wariacje[0];

        printf("%d %d %d %d ?\n", propozycja.cyfry[0], propozycja.cyfry[1], propozycja.cyfry[2], propozycja.cyfry[3]);

        printf("Na swoim miejscu: ");
        scanf("%d", &liczba_poprawnych);

        if (liczba_poprawnych == 4) {
            printf("Zgadlem!\n");
            break;
        }

        printf("Nie na swoim miejscu: ");
        scanf("%d", &liczba_na_zlym_miejscu);
        int nowy_rozmiar = 0;
        
        for (int i = 0; i < rozmiar; i++) {
            Kod kandydat = wariacje[i];
            int zle, dobre;
            sprawdz(kandydat, propozycja, &zle, &dobre);

            if (zle == liczba_na_zlym_miejscu && dobre == liczba_poprawnych) {
                wariacje[nowy_rozmiar] = kandydat;
                nowy_rozmiar++;
            }
        }
        rozmiar = nowy_rozmiar;
    }

    return 0;
}