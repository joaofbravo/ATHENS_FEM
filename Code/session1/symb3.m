syms t

sol1=dsolve('D2y-9*Dy+8*y=exp(8*t)')
sol2(t)=dsolve('D2y-9*Dy+8*y=exp(8*t)','y(0)=1','Dy(0)=1')

t=0:0.01:0.5;
plot(t,sol2(t))
hold on
plot(t,2*ones(1,51),'r')
grid minor
zoom on

disp('y=2 -> t=0.358')