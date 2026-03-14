import math

def IsPrime(n):
    if n < 2:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, int(math.sqrt(n)) + 1, 2):
        if n % i == 0:
            return False
    return True

def Prime(n):
    count = 0
    liczba = 1
    while count < n:
        liczba += 1
        if IsPrime(liczba):
            count += 1
    return liczba

def PrimeNumbers(n):
    count = 0
    for i in range(2, n + 1):
        if IsPrime(i):
            count += 1
    return count