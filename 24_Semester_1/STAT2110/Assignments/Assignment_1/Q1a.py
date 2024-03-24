import itertools

candidates = ['p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9']

combs = itertools.permutations(candidates, 4)

for comb in combs:
    print(comb)
