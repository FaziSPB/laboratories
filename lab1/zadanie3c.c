#include <stdio.h>
 int main() {
        int n,m,p,oryginal_n;
        m = 0;
        printf("Podaj liczbe n: ");
        scanf("%d", &n);
        printf("Podaj liczbe p: ");
        scanf("%d", &p);
        oryginal_n = n;
        while ((n > 0)&&(p >= 0)) {
            m = m*p + (n % p);
            n /= p;
        }
        if (m==oryginal_n) {
            printf("Liczba %d jest palindromem w systemie o podstawie %d\n", oryginal_n, p);
        } else {
            printf("Liczba %d nie jest palindromem w systemie o podstawie %d\n", oryginal_n, p);
        }
 return 0;}