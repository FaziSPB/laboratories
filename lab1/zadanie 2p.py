import math 

a, b, c = map(float, input("Podaj a,b i c: ").split())
delta = b**2 - 4*a*c
if delta>0:
    x1 = (-b + math.sqrt(delta))/(2*a)
    x2 = (-b - math.sqrt(delta))/(2*a)
    print (f"Rownanie ma dwa rozwiazania", x1,",",x2)
elif delta==0:
    x3 = -b/2*a
    print ("Rownanie ma jedno rozwiazanie", x3)
else:
    print ("Rownanie nie ma rozwiazan")