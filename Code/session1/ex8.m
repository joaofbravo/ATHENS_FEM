x=zeros(250);
x(1)=0.1;

for i = 1:249
   x(i+1)=3.5*x(i)*(1-x(i));
end

for i = [241 242 245 246 249 250]
   x(i)
end
