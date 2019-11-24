%  ASSEMBLEMATRIX   Function that constructs a stiffness matrix.
%     S = ASSEMBLEMATRIX(ELMAT,XVEC,YVEC,REGION,D_AIR,D_MET,E) returns the
%     sparse mass matrix M and the sparse stiffness matrix S for the 
%     diffusion part D*(d^2c/dx^2+d^2c/dy^2), both on the triangulation 
%     {ELMAT,XVEC,YVEC} with  REGION-dependent diffusion with value D_AIR 
%     or D_MET and XXX with value E or zero.
%  
%     See also ASSEMBLEVECTOR, CONDUCTIVITY, DIFFUSION, SPARSE, STIFFNESSELEMENTMATRIX.
% 
