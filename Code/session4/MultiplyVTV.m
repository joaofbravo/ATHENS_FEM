function vecS = MultiplyVTV(V1,T,V2)
% T in 2D form: (nxn)xn
% Returns vector (nx1)

N = size(V2,1);
auxM = T*V2;
auxM = reshape(auxM,[N N]);
vecS = (V1*auxM)';
