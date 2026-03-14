def primenumbers(n) :
    def create_sieve(s, n) :
        for _ in range(n+1) :
            s.append(True)
        s[0] = s[1] = False
    def compute_sieve(s) :
        for i in range(2, int(len(s)**0.5) + 1) :
            if s[i] :
                for j in range(i*i, len(s), i) :
                    s[j] = False
    def count_primes(s) :
        c = 0
        for e in s :
            if e :
                c += 1
        return c 
    s = []
    create_sieve(s, n)
    compute_sieve(s)
    return count_primes(s)
def main() :
    try: 
        n = int(input(""))
        if n < 2:
            print ("Zla wartosc")
        else :
            print(primenumbers(n))
    except ValueError:
        print("Zla wartosc")
if __name__ == "__main__" :
    main()