#include <stdio.h>
#include <math.h>

double f(double x) {
    return cos(x / 2.0);
}

double findZero(double (*func)(double), double a, double b, double eps) {
    double c = (a + b) / 2.0;
    while ((b - a) > eps) {
        c = (a + b) / 2.0;
        if (func(c) == 0.0) {
            return c;
        } else if (func(a) * func(c) < 0.0) {
            b = c;
        } else {
            a = c;
        }
    }
    return c;
}

int main() {
    double a = 2.0;
    double b = 4.0;
    double eps;
    double res;

    for (int k = 1; k <= 8; k++) {
        eps = pow(10, -k);
        res = findZero(f, a, b, eps);
        printf("Epsilon: %g, Zero: %.16f\n", eps, res);
    }

    return 0;
}