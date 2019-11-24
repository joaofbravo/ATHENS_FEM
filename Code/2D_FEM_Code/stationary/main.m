clear all
close all

% load the triangular mesh, the coordinates and to which region the
% elements belong

[elmat,xvec,yvec,region] = LoadMesh('fine'); % finest mesh
% [elmat,xvec,yvec,region] = LoadMesh('medium'); % medium mesh
% [elmat,xvec,yvec,region] = LoadMesh('coarse'); % coarsest mesh

% plot the mesh and the regions
PlotMesh(elmat,xvec,yvec,region);

% physical parameters
D_air = 1; % Diffusion coefficient of the air
D_met = 1e-3; % Diffusion coefficient of the metal
Amp = 7.5; % Amplitude of the source term

% assemble the matrix and the vector
S = AssembleMatrix(elmat,xvec,yvec,region,D_air,D_met);
f = AssembleVector(elmat,xvec,yvec,region,Amp);

% Use the Dirichlet boundary condition
I = find((xvec==min(xvec))|(xvec==max(xvec))|(yvec==min(yvec))|(yvec==max(yvec)));
S(I,:) = 0;
S(sub2ind(size(S),I,I)) = 1;
f(I,:) = 0;

% solve the system
u = S\f;

% plot the solution
PlotSol(elmat,xvec,yvec,u,region);