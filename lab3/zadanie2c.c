#include <stdio.h>
#include <stdlib.h>

unsigned long long dwumian(unsigned long long n, unsigned long long k) {
    if (k == 0 || k == n) {
        return 1;
    }
    if (k > n) {
    return 0;
}
unsigned long long *T = calloc(n+1, sizeof(unsigned long long));
T[0] = 1;
for (unsigned long long i = 1; i <= n; i++) {
    for (unsigned long long j = i; j > 0; j--) {
        T[j] = T[j] + T[j-1];
    }
}
return T[k];
free(T);
}
int main() {
    printf("n : ");
    unsigned long long n;
    scanf("%llu", &n);
    printf("k : ");
    unsigned long long k;
    scanf("%llu", &k);
    printf("%llu\n", dwumian(n, k));
    return 0;
}

    