syms x x0

f(x)=cos(pi*x);
df(x)=diff(f,x);

m=double(df(0.2));
F=double(f(0.2));

x0=double(solve(F-m*0.2-x0,x0));
fprintf('y = %.3f*x + %.3f\n',m,x0)

X=0:0.01:1;
Y=m*X+x0;
plot(X,f(X),'r')
hold on
plot(X,Y,'b--')