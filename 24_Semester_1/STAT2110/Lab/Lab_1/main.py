# INIT
year2 = {"Jordan", "Zac", "Ming", "Hayley"}
dou_deg = {"Zac", "Ming", "Ryan", "Olivia"}
hour10 = {"Jordan", "Ming", "Hayley", "Adam"}

## A)
print(year2 | dou_deg)
## B)
print(year2 & hour10)
## C)
print(year2 - hour10)
## D)
print(dou_deg ^ hour10)
## E)
print(year2 & dou_deg & hour10)
## F)
print((year2 & hour10) - dou_deg)
## G)
print((year2 | dou_deg) - hour10)