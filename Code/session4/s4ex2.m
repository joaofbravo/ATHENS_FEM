% close all
% clear all
% clc

N = 30;
xMin = 0;
xMax = 1;
beta = 1;
u0 = zeros(N+1,1);

X = GenerateMeshNL(N,xMin,xMax);
M = AssembleMatrixNL(N,xMin,xMax);
T = AssembleTensorNL(N,xMin,xMax);
f = AssembleVectorNL(N,xMin,xMax,beta);

tic
% Iterative solver 
Nfun = @(uh) SolveForm(uh,M,T,f);
Noptions = optimoptions(@fsolve,'MaxFunctionEvaluations',1000000,'MaxIterations',1000000);
uh = fsolve(Nfun,u0,Noptions);
toc

figure(1)
plot(X,uh,'b')
hold on
plot(X,ExactSolu(X,beta),'r')
grid on

% figure(2)
% plot(X,ExactSolu(X,beta)'-uh,'g')