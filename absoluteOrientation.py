##########################################################################################################################################

# Python code for Absolute Orientation of dataset B to dataset A, both with n points each, where for each i in {1,2,...,n}, points A_i and B_i correspond

##########################################################################################################################################

import numpy as np


# loading datasets : Dummy matrices initiated here. You can load accordingly.
A = np.random.rand(100,30)
B = np.random.rand(100,30)

# centering 
Aprime = A - np.mean(A,0)
Bprime = B - np.mean(B,0)

# rotation
N = np.zeros((np.shape(A)[1],np.shape(A)[1]));
for i in range(m):
	N = N + np.outer(Bprime[i],Aprime[i])

U,S,V = np.linalg.svd(N1)
R = np.matmul(U,V)
newBprime = np.matmul(Bprime, R1) 

# scaling
s1=0.0
s2=0.0

for i in range(0,m):
	s1=s1+np.dot(Aprime[i],newBprime[i])
	s4=s4+np.dot(Bprime[i], Bprime[i])

s = s1/s2;

# output matrix : B oriented onto A
newB = s*newBprime + np.mean(A,0)
