function [Fmesh,N] = GenerateMesh(N,xMin,xMax,I)
Fmesh = linspace(xMin,xMax,N+1);

% Refine areas given by I (indexes of nodes with error > threshold) 
if nargin == 4
    OrderMag = 10; 

    for i=I'
        if i==1
            i=2;
        elseif i==N+1
            i=N;
        end
        
        sizelow = Fmesh(i)-Fmesh(i-1);
        sizeup = Fmesh(i+1)-Fmesh(i);

        if sizelow > OrderMag*sizeup
            Fmesh = [Fmesh(1:i-1) 0.5*(Fmesh(i-1)+Fmesh(i)) Fmesh(i:end)];
            N=N+1;
        elseif sizeup > OrderMag*sizelow
            Fmesh = [Fmesh(1:i) 0.5*(Fmesh(i)+Fmesh(i+1)) Fmesh(i+1:end)];
            N=N+1;
        else
            Fmesh = [Fmesh(1:i-1) 0.5*(Fmesh(i-1)+Fmesh(i)) Fmesh(i) 0.5*(Fmesh(i)+Fmesh(i+1)) Fmesh(i+1:end)];
            N=N+2;            
        end
    end
end