A=[5 -10 1; -10 5 -3; 1 -3 2];
b=ones(3,1);

x=A\b

% or for multiple b-vectors:

[L,U] = lu(A);
y=L\b
x=U\y