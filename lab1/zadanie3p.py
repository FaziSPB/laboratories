n = int(input("Podaj n: "))
m = 0
p = int(input("Podaj p: "))
n_oryginal = n
while n > 0 and p >= 2:
    m = m * p + n % p
    n //= p
if n_oryginal == m:
    print("TAK, jest palindromem")
else:
    print("NIE, nie jest palindromem")
