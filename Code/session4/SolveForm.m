function F = SolveForm(x,M,T,f)
% Returns M*x+S(x)-f = 0

S = MultiplyVTV(x',T,x);
F = M*x+S-f;
end