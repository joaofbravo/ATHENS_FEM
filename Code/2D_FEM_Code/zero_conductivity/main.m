clear all
close all

% load the triangular mesh, the coordinates and to which region the
% elements belong

% [elmat,xvec,yvec,region] = LoadMesh('fine'); % finest mesh
% [elmat,xvec,yvec,region] = LoadMesh('medium'); % medium mesh
[elmat,xvec,yvec,region] = LoadMesh('coarse'); % coarsest mesh

% plot the mesh en the regions
PlotMesh(elmat,xvec,yvec,region);

% physical parameters
D_air = 1; % Diffusion coefficient of the air
D_met = 1e-3; % Diffusion coefficient of the metal
Amp = 7.5; % Amplitude of the source term
Period = 2*pi; % Period of the source term
omega = (2*pi)/Period; % Frequency factor of the source term
time = 0; % Starting time of simulation
u0 = 0; % Initial value
time_end = 2*pi; % ending time of simulation
T = 25; % Number of iterations
dt = (time_end-time)/T; % The size of the time-step
% assemble the matrix
S = AssembleMatrix(elmat,xvec,yvec,region,D_air,D_met);

% Use the Dirichlet boundary condition
I = find((xvec==min(xvec))|(xvec==max(xvec))|(yvec==min(yvec))|(yvec==max(yvec)));
S(I,:) = 0;
S(sub2ind(size(S),I,I)) = 1;

% set the initial condition
u = u0*ones(size(xvec));

% plot the initial solution
PlotSol(elmat,xvec,yvec,u,region,time(end)+dt);

% start the time-loop
for t=1:T

    % assemble the vector at the next time
    f = AssembleVector(elmat,xvec,yvec,region,Amp,omega,time(end)+dt);
    
    % Use the Dirichlet boundary condition
    f(I,:) = 0;

    % solve the system
    u(:,end+1) = S\f;

    % plot the current solution
    PlotSol(elmat,xvec,yvec,u(:,end),region,time(end)+dt);
    
    % update time
    time(end+1) = time(end)+dt;
end