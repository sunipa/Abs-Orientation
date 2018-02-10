%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  Code for Absolute Orientation of dataset B to dataset A, both with n points each, where for each i in {1,2,...,n}, points A_i and B_i correspond

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% loading datasets : Here, I just create two random matrices of identical dimensions
A = rand(100,30);
B = rand(100,30):

% centering 
Aprime=A-mean(A);
Bprime=B-mean(B);

% rotation
N=zeros(size(A,2),size(A,2));

for i = 1:size(A,1)
	N=N + Bprime(i,:)'*Aprime(i,:);
end

[u,s,v] = svd(N);
R = v*(u');

B_rot = Bprime*(R');

% finding the scale (optional)
s = 1.0; s1 = 0.0; s2 = 0.0;
for i=1:size(A,1)
	s1 = s1 + dot(Aprime(i,:),B_rot(i,:));
	s2 = s2 + dot(Bprime(i,:),Bprime(i,:));  %dot product of B_i
end

s=s1/s2;

% getting the rotated, translated and scaled matrix
newB = s*B_rot + mean(A)


