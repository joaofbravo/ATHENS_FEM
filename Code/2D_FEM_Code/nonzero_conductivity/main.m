clear all
close all

% load the triangular mesh, the coordinates and to which region the
% elements belong

% [elmat,xvec,yvec,region] = LoadMesh('fine'); % finest mesh
% [elmat,xvec,yvec,region] = LoadMesh('medium'); % medium mesh
[elmat,xvec,yvec,region] = LoadMesh('coarse'); % coarsest mesh

% plot the mesh en the regions
% PlotMesh(elmat,xvec,yvec,region);

% physical parameters
E = 1e-6; % Conductivity coefficient of the metal
D_air = 1; % Diffusion coefficient of the air
D_met = 1e-3; % Diffusion coefficient of the metal
Amp = 10; % Amplitude of the source term
Period = 2*pi; % Period of the source term
omega = (2*pi)/Period; % Frequency factor of the source term
time = 0; % Starting time of simulation
u0 = 0; % Initial value
time_end = 2*pi; % ending time of simulation
T = 25; % Number of iterations
dt = (time_end-time)/T; % The size of the time-step

% assemble the matrices
[M,S] = AssembleMatrix(elmat,xvec,yvec,region,D_air,D_met,E);

% Use the Dirichlet boundary condition
I = find((xvec==min(xvec))|(xvec==max(xvec))|(yvec==min(yvec))|(yvec==max(yvec)));
S(I,:) = 0;
M(I,:) = 0;
M(sub2ind(size(S),I,I)) = 1;

% set the initial condition
u = u0*ones(size(xvec));

% plot the initial solution
PlotSol(elmat,xvec,yvec,u,region,time(end)+dt);

% start the time-loop
for t=1:T

    % assemble the vector at the prevoius time step
    f_old = AssembleVector(elmat,xvec,yvec,region,Amp,omega,time(end));
    % assemble the vector at the next time step
    f_new = AssembleVector(elmat,xvec,yvec,region,Amp,omega,time(end)+dt);
    
    % Use the Dirichlet boundary condition
    f_old(I,:) = 0;
    f_new(I,:) = 0;

    % solve the system
%     u(:,end+1) = M\((M+dt*S)*u(:,end)+dt*f_old); % Euler Forward
%     u(:,end+1) = (M-dt*S)\(M*u(:,end)+dt*f_new); % Euler Backward
    u(:,end+1) = (M-dt/2*S)\((M+dt/2*S)*u(:,end)+dt/2*f_old+dt/2*f_new); % Crank-Nicholson

    % plot the current solution
    PlotSol(elmat,xvec,yvec,u(:,end),region,time(end)+dt);
    
    % update time
    time(end+1) = time(end)+dt;
end