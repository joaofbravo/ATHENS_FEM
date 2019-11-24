syms x

u(x)=-(x-1)^2*sin(pi*x);
du=diff(u,x);
ddu(x)=diff(du,x);

simplify(-ddu)
u(0)
du(1)

x_int=linspace(0,1);
plot(x_int,u(x_int),'b');