A=[5 -10 1; -10 5 -3; 1 -3 2];
x=zeros(3,10);
x(:,1)=ones(3,1);

% blackslash method

for i=1:9
    x(:,i+1) = A\x(:,i);
end

% LU decomp

[L,U] = lu(A);

x2=zeros(3,10);
x2(:,1)=ones(3,1);

for i=1:9
    y=L\x2(:,i);
    x2(:,i+1)=U\y;
end

% display

disp(['           \:          LU:' newline '  ------------------------'])
for i=1:10
    disp([x(:,i) x2(:,i)])
    disp(' ')
end