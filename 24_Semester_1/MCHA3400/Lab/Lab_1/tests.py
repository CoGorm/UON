import CoolProp.CoolProp as cp

ans = cp.PropsSI('T','P',101325,'Q',0,'Water')
print(ans)
