#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int N;
int *tablica;
bool *bije_wiersz;
bool *bije_przek1;
bool *bije_przek2;

void ustaw(int i) {
    for (int j = 1; j <= N; j++) {

        if (!bije_wiersz[j] && !bije_przek1[i + j] && !bije_przek2[i - j + N]) {
            tablica[i] = j;
            bije_wiersz[j] = true;
            bije_przek1[i + j] = true;
            bije_przek2[i - j + N] = true;

            if (i < N) {
                ustaw(i + 1);
            } else {
                for (int k = 1; k <= N; k++) {
                    printf("%d%s", tablica[k], (k == N) ? "" : " ");
                }
                printf("\n");
            }

            bije_wiersz[j] = false;
            bije_przek1[i + j] = false;
            bije_przek2[i - j + N] = false;
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc < 2) return 0;

    N = atoi(argv[1]);

    tablica = (int*)calloc(N + 1, sizeof(int));
    bije_wiersz = (bool*)calloc(N + 1, sizeof(bool));
    bije_przek1 = (bool*)calloc(2 * N + 1, sizeof(bool));
    bije_przek2 = (bool*)calloc(2 * N + 1, sizeof(bool));

    if (tablica && bije_wiersz && bije_przek1 && bije_przek2) {
        ustaw(1);
    }

    free(tablica);
    free(bije_wiersz);
    free(bije_przek1);
    free(bije_przek2);

    return 0;
}