import random **



"""
parameters x test_image --> smile meh sad angry
test_image --> smile

"""

def gradDescent(x,y,darkness):

	"""
	x_n+1 = x_n - grad(x_n)

	grad = d(darkness)/dx + d(darkness)/dy

	"""

	#return a vector of errors that you can multiply with weight to learn better




def genData(x,y):
	for i in range(x):
		for j in range(y):
			z[i,j] = random(-1,1)

	return x,y,z



