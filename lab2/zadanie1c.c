#include <stdio.h>

int gcd(int a, int b) {
    while (b != 0) {
        int c = b;
        b = a % b;
        a = c;
    }
    return a;
}
int main() {
    int a, b;
    printf("Podaj dwie liczby calkowite: ");
    scanf("%d %d", &a, &b);
    printf("NWD(%d, %d) = %d\n", a, b, gcd(a, b));
    return 0;
}