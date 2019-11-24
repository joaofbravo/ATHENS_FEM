syms x b

u(x)=b/2*x^2;
du=diff(u,x);
ddu(x)=diff(du,x);

f(x)=-ddu(x)+u(x)^2

u(0)
du(1)

x_int=linspace(0,1);
beta = 1;
plot(x_int,subs(u(x_int),b,beta),'r');