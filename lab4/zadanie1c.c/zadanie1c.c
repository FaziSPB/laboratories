#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <string.h>

#include "is_prime.h"
#include "prime.h"
#include "prime_numbers.h"

int main(int argc, char *argv[]) {
    if (argc != 3) {
        return 1;
    }
    char *komenda = argv[1];
    unsigned n = (unsigned)atoi(argv[2]);

    if (strcmp(komenda, "pn") == 0) {
        unsigned wynik = primenumbers(n);
        printf("%u\n", wynik);
    } else if (strcmp(komenda, "pr") == 0) {
        int wynik = prime(n);
        printf("%d\n", wynik);
    } else if (strcmp(komenda, "ip") == 0) {
        if (is_prime((int)n)) {
            printf("true\n");
        } else {
            printf("false\n");
        }
    } else {
        return 1;
    }
    return 0;
}
