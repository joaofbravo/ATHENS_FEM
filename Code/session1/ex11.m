format short
disp(' ')
disp('         x      y(x)')

for i = 0:10
    x(i+1)=i*pi/10;
    y(i+1)=sin(x(i+1));
end

disp([x' y])