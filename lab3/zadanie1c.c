#include <stdio.h>
#include <stdbool.h>
#include <math.h>

void compute_sieve(bool s[], unsigned n) {
    unsigned i, j;
    for (i = 2; i <= n; i++) s[i] = true;
    for (i = 2; i <= sqrt(n); i++) 
        if (s[i]) 
            for (j = i*i; j <= n; j += i) 
                s[j] = false;

}
unsigned count_primes(bool s[], unsigned n) {
    unsigned i, c = 0;
    for (i = 2; i <= n; i++)
        if (s[i]) c++;
    return c;
}
unsigned primenumbers(unsigned n) {
    bool sieve[n+1];
    compute_sieve(sieve, n);
    return count_primes(sieve, n);
}
int main() {
    int a;
    if (scanf("%u", &a) != 1 || a < 2) {
        printf("Zla wartosc\n");
        return 1;
    }
    unsigned n = (unsigned)a;
    unsigned result = primenumbers(n);
    printf("%u\n", result);
    return 0;
}