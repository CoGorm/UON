import math

def permutation(n, r):
    return (math.factorial(n)/math.factorial(n-r))

def combination(n,r):
    return (math.factorial(n)/(math.factorial(r) * math.factorial(n-r)))

print(permutation(10, 2))
print(combination(10, 2))
