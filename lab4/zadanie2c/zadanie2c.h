#include <stdio.h>
unsigned totient(unsigned n) {
    unsigned wynik = n;
    unsigned a = n;
    int d = 3;
    int potega = 0;
    while (a % 2 == 0) {
        potega += 1;
        a = a / 2;
    }
    if (potega > 0)
        wynik /= 2;
    for (;d*d<=a;){
        potega = 0;
        while (a % d == 0) {
                potega+=1;
                a = a / d;
            }
        if (potega > 0) {
            wynik = wynik / d * (d-1);
            }
        d = d+2;
        }
    if (a > 2)
        wynik = wynik / a * (a-1);       
    return wynik;
}
