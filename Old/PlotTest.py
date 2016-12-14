import matplotlib.pyplot as plt
from matplotlib.pyplot import cm
import numpy as np
# from sympy.physics.vector import *
# from sympy.physics.vector import ReferenceFrame
# from sympy.physics.vector import curl

def plotGen(plotType):

	# R = sympy.physics.vector.ReferenceFrame('R')
	if plotType == "vector":
		X, Y= np.mgrid[-5:5, -5:5]
		Z = X**2+ Y**2

		U = -1-np.cos(X**2+Y+Z)
		V = 1+ X-Y+Z
		W = 1- X*Y+Z

		speed = np.sqrt(U**2+V**2)
		UN = U/speed
		VN = V/speed
		WN = W/speed

		# F = (-1-np.cos(R[0]**2+R[1]))*R.x + (1+ R[0]-R[1])*R.y 

		plot = plt.figure()
		plt.quiver3 (Z,U,V,W)
		
			# cmap = cm.cool,
			# headlength = 5)
		plt.colorbar()
		plt.show(plot)

	# elif plotType == "scalar":






plotGen("vector")


