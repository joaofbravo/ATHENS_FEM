% close all
% clear all
% clc

syms x
b =1;
Omega = [0 1];
a =1;

fun = @Sfct;

N = 11;
xo = zeros(N,1);
uh = fsolve(fun,xo);

% uh = dsolve(0 == 1/deltaX * S2 * c +  a/deltaX * Sfct(c) - f, c)

Xi =  GenerateMesh(Omega,N);
U = b/2 * x^2;

figure(9)
plot(Xi,double(subs(U,x,Xi)))
hold on
plot(Xi,uh)

function C = Sfct(c)
% defining the problem

syms x

b =1;
Omega = [0 1];
a =1;

U = b/2 * x^2;

D1U = diff(U,x);

D2U = diff(diff(U,x),x);

g = -D2U + a * U^2;

N=11;

% making the mesh

Xi =  GenerateMesh(Omega,N+1);

% making the 3 dimensional matrix (coefficient in front of u^2)

S3= zeros(N,N*N);

for k=1:1:N-1
    S3(k, N*(k-1) + k)    = 6;
    S3(k, N*(k-1) + k+1)  =1;
    S3(k+1,N*(k-1) + k)  =1;
    S3(k+1, N*(k-1) + k+1)=1;
    S3(k, N*k + k)    =1;
    S3(k, N*k + k+1)  =1;
    S3(k+1, N*k + k)  =1;
end

S3(1,1) = 1;
S3(1,2)=0;
S3(1,N+1)=0;
S3(1,N+2)=0;
S3(N,N*N)=3;

% making the 2 dimensional matrix for the classic ?u term

Xplus1 = 2*ones(1,N);
Xminus1 = -1 * ones(1,N-1);

S2 = diag(Xplus1) + diag(Xminus1,1) + diag(Xminus1,-1);

S2(1,2) = 0;

% making the resulting vector

f = zeros(N,1);

for i = 1:1:N-1
    fe = GenerateElementVector(Xi,g,x,i);
    f(i)= f(i) + fe(1);
    f(i+1)= f(i+1) + fe(2);
end
f(1)=0;
f(N) = f(N)+ b;
deltaX = Xi(2) - Xi(1);

% the equation that we want to solve

 C = 1/deltaX * S2 * c +  a/deltaX * reshape(S3' * c, [N N]) *c - f;

return
end




function [ Xi ] = GenerateMesh( Omega, N )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Xi = linspace(Omega(1),Omega(2),N);

return

end


function [ fei ] = GenerateElementVector( Xi, g , x, i )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

fei = (Xi(i+1) - Xi(i) )/2 * [subs(g,x,Xi(i)) ; subs(g,x,Xi(i+1))];syms x y u(x)

U = x*(x-1)* y*(1-y);

GradU = [diff(U,x) diff(U,y)];

DivU = diff(diff(U,x),x) + diff(diff(U,y),y);

Omega = [[0 1];[0 1]];

N=100;

return

end

