#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int znajdz(int(n)) {
    if (n <= 0) {
        return 0;
    }
    int *pierwsze = malloc(n * sizeof(int));
    int c = 0;
    int liczba = 2;
    while (c < n) {
        bool pierwsza = true;
        for (int i = 0; i < c; i++) {
            int p = pierwsze[i];
            if (p*p > liczba) {
                break;
            }
            if (liczba % p == 0) {
                pierwsza = false;
                break;
            }
        }
        if (pierwsza) {
            pierwsze[c] = liczba;
            c++;
        }
        liczba++;
    }    
    int wynik = pierwsze[n-1];
    free(pierwsze);
    return wynik;
}
int main() {
    int n;
    printf("n: ");
    scanf("%d", &n);
    int wynik = znajdz(n);
    printf("%d\n", wynik);
    return 0;
}
    
