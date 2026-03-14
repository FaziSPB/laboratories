#include <stdio.h>
int is_prime(int n) {
    int i;
    if (n <= 1) return 0; 
    if (n == 2) return 1;
    if (n % 2 == 0) return 0;
    i = 3;
    while (i*i <= n) {
        if (n % i == 0) return 0;
        i += 2;}
    return 1;
}
