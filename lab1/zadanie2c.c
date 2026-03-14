#include<stdio.h>
#include<math.h>
int main() {
    float a, b, c, delta;
    printf("Podaj trzy liczby a,b i c: ");
    scanf("%f %f %f", &a, &b, &c);
    delta = b*b - 4*a*c;
    if (delta < 0) {
        printf("Brak rozwiazan rzeczywistych\n");
    } else if (delta == 0) {
        printf("Jest jedno rozwiazanie rzeczywiste: %f\n", -b/(2*a));
    } else {
        printf("Sa dwa rozwiazania rzeczywiste: %f i %f\n", (-b - sqrt(delta)) / (2*a), (-b + sqrt(delta)) / (2*a));}

    return 0;}