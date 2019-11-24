for i=1:5
    [p,e,t]=GenerateMesh2D(0,1,0,1,i*0.1);
    figure(i);
    pdemesh(p,e,t);
    % hold on
    % GenerateGeometry(0,1,0,1);
end