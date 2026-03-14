import math

def findZero(f, a, b, eps):
    c = (a + b) / 2
    
    while b - a > eps:
        c = (a + b) / 2
        if f(c) == 0:
            return c
        elif f(a) * f(c) < 0:
            b = c
        else:
            a = c
            
    return c

def f(x):
    return math.cos(x/2)

a = 2
b = 4


for k in range(1, 9):
    eps = 10**(-k)
    wynik = findZero(f, a, b, eps)
    print(f"Epsilon: {eps}, Zero: {wynik}")