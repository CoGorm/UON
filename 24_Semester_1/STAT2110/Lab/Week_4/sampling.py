import math
import numpy as np
import scipy as sp
import pandas as pd
import matplotlib.pyplot as plt


suits=["Hearts", "Diamonds", "Spades", "Clubs"]
cards=np.repeat(suits, 13)

n_sim = 10000
X=[]
Y=[]
for i in range(n_sim):
    draw5Replace = np.random.choice(cards,5,replace=True)
    draw5WithoutReplace = np.random.choice(cards,5,replace=False)
    X.append(sum(draw5Replace=="Clubs"))
    Y.append(sum(draw5WithoutReplace=="Clubs"))

X1=pd.DataFrame(X,columns=list("X"))
Y1=pd.DataFrame(Y,columns=list("Y"))
TabX=pd.DataFrame(columns=['X', 'Count', 'Percent'])
TabY=pd.DataFrame(columns=['Y', 'Count', 'Percent'])
TabX['Count']=X1['X'].value_counts().sort_index()
TabX['Percent']=X1['X'].value_counts().sort_index()/n_sim
TabX['X'] = TabX.index
print(TabX)

TabY['Count']=Y1['Y'].value_counts().sort_index()
TabY['Percent']=Y1['Y'].value_counts().sort_index()/n_sim
TabY['Y'] = TabY.index
print(TabY)

offset=0.05

plt.stem(TabX['X']-offset,TabX['Percent'], markerfmt='bo', label='With Replacement')
plt.stem(TabY['Y']+offset,TabY['Percent'], markerfmt='go', label='Without Replacement')
plt.legend()
plt.xlabel("Number of clubs drawn")
plt.ylabel("Empirical probability")
plt.title("Empirical Probability Mass Function")
#plt.show()

print("### Exercise 1")
print("Having generated the empirical probability mass functions, answer the following questions.")
print("a) - Is it more likely that we would draw 1 club in a set of 5 cards with or without replacement?")
print(TabX["Percent"][1])
print(TabY["Percent"][1])
print("b) -  Is it more likely that we would draw 2 clubs in a set of 5 cards with or without replacement?")
print(TabX["Percent"][2])
print(TabY["Percent"][2])
print("c) - Is it more likely that we would draw 3 clubs in a set of 5 cards with or without replacement?")
print(TabX["Percent"][3])
print(TabY["Percent"][3])
print("d) -  Using concepts from Week 2, verify by hand that 𝑃(𝑌 = 1) = 0.411$, 𝑃(𝑌 = 2) = 0.274, and 𝑃(𝑌 = 3) = 0.082. Do your empirical probabilities for variable Y resemble these theoretical probabilities?")
print(math.comb(13, 1) * math.comb(39, 4) / math.comb(52, 5))
print(math.comb(13, 2) * math.comb(39, 3) / math.comb(52, 5))
print(math.comb(13, 3) * math.comb(39, 2) / math.comb(52, 5))
