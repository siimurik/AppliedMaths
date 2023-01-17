import math as m
from scipy.special import erfinv

print("Tere tulemast Laplace'i pöördfunktsiooni algoritmi!")

x = float(input("Sisesta x, 0<x<0.5: "))

if x==0.5 or x>0.5:
	print("Laplace'i pöördfunktsioon Φ-1(x), kus x =",x,"on ligikaudu võrdne", 5.0)
else:
	Poord = m.sqrt(2)*erfinv(2*x)
	print("Laplace'i pöördfunktsioon Φ-1(x), kus x =",x,"on ligikaudu võrdne", Poord) 