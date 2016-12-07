import matplotlib.pyplot as plt
from matplotlib.pyplot import cm
import numpy as np
from sympy.physics.vector import *
# from sympy.physics.vector import ReferenceFrame
# from sympy.physics.vector import curl

def plotGen(type):

	R = sympy.physics.vector.ReferenceFrame('R')


	Y, X = np.mgrid[-3:3, -3:3]

	U = -1-np.cos(X**2+Y)
	V = 1+ X-Y

	speed = np.sqrt(U**2+V**2)
	UN = U/speed
	VN = V/speed

	F = (-1-np.cos(R[0]**2+R[1]))*R.x + (1+ R[0]-R[1])*R.y 
	
	G = curl(F,R)

	print G

	plot = plt.figure()
	plt.quiver (X,Y,U,V, U, cmap = cm.PuOr, headlength = 5)

	plt.colorbar()

	plt.show(plot)



plotGen(5)


