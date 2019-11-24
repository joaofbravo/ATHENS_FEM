N=100;
h=2/N;
n=(0:N)';

x = n*h;
x2 = linspace(0,N*h,101)';

y=sqrt(x);
z=x.*x;
disp([x x2 y z]);

grid on
hold on
plot(x,y,'LineWidth',2,'Color','r')
plot(x,z,'LineWidth',1,'Color','b')
hold off

% or: plot(x,y,'b',x,z,'r','LineWidth',2)