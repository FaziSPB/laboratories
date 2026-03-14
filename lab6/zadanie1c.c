#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int N;
int *tablica;

int czy_bezpiecznie(int kolumna, int wiersz) {
    for (int i = 0; i < kolumna; i++) {
        if (tablica[i] == wiersz) {
            return 0;
        }
        if (abs(tablica[i] - wiersz) == abs(i - kolumna)) {
            return 0;
        }
    }
    return 1;
}

void rozwiazanie_n_hetmanow(int kolumna) {
    if (kolumna == N) {
        for (int i = 0; i < N; i++) {
            printf("%d%s", tablica[i] + 1, (i == N - 1) ? "" : " ");
        }
        printf("\n");
        return;
    }

    for (int wiersz = 0; wiersz < N; wiersz++) {
        if (czy_bezpiecznie(kolumna, wiersz)) {
            tablica[kolumna] = wiersz;
            rozwiazanie_n_hetmanow(kolumna + 1);
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc < 2) return 1;
    
    N = atoi(argv[1]);
    tablica = (int*)malloc(N * sizeof(int));
    
    if (tablica) {
        rozwiazanie_n_hetmanow(0);
        free(tablica);
    }
    
    return 0;
}