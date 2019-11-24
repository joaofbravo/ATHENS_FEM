syms x t
% syms pi % to check symbollic equality

u(x,t)=exp(-pi^2*t).*cos(pi*x)+1;

dut(x,t)=diff(u,t);
dux(x,t)=diff(u,x);
ddux(x,t)=diff(dux,x);

u(x,0)
dux(0,t)
dux(1,t)

x_int=linspace(0,1);
t_int=linspace(0,1);

[X,T]=meshgrid(x_int,t_int);
surf(X,T,double(u(X,T)))

xlabel('X');
ylabel('T');
rotate3d on;