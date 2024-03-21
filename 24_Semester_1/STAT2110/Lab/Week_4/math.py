import math
import numpy as np
import scipy as sp

n_sim = 100000

suits=["Hearts", "Diamonds", "Spades", "Clubs"]
cards=np.repeat(suits, 13)
C = sum(cards=="Clubs")
S = sum(cards=="Spades")
print(f"{C} {S} {C+S}")
H = sum(cards=="Hearts")
D = sum(cards=="Diamonds")
print(f"{H} {D} {H+D}")
X=[]
Y=[]
for i in range(n_sim):
    draw5Replace = np.random.choice(cards,5,replace=True)
    draw5WithoutReplace = np.random.choice(cards,5,replace=False)
    X.append(sum(draw5Replace=="Clubs"))
    Y.append(sum(draw5WithoutReplace=="Clubs"))
