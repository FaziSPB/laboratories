#include <stdio.h>
#include <stdlib.h>
#include "zadanie2c.h"
int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Zla wartosc\n");
        return 1;
    }
    for (int i = 1; i < argc; i++) {
        unsigned n = (unsigned)atoi(argv[i]);
        unsigned result = totient(n);
        printf("totient(%u) = %u\n", n, result);
        
    }
    return 0;
}