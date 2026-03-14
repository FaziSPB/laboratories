#include <stdio.h>
int main() {
    int a, d, potega, pierwsza;
    d = 2;
    pierwsza = 1;
    printf("Podaj liczbe calkowita: ");
    scanf("%d", &a);
    while (d * d <= a) {
        potega = 0;
        while (a % d == 0) {
            a /= d;
            potega++;
        }
        if (potega > 0) {
            if (!pierwsza) {
                printf(" * ");
            }
            if (potega == 1) 
                printf("%d", d);
            else 
                printf("%d^%d", d, potega);
            pierwsza = 0;
            }
        d++; 
        }    
    if (a > 1) {
        if (!pierwsza) printf(" * ");
            printf("%d", a);
        }       
    printf("\n");       
    return 0;
}
