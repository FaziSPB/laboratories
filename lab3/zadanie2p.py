def dwumian(n, k):
    if not (0 <= k <= n):
        return 0
    if k == 0 or k == n:
        return 1
    T= [1] + [0]*n
    for i in range(1, n+1):
        for j in range(i, 0, -1):
            T[j] = T[j] + T[j-1]
    return T[k]
def main():
    n = int(input("n: "))  
    k = int(input("k: "))
    print(dwumian(n, k))
if __name__ == "__main__":
    main()