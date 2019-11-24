%  ASSEMBLEMATRIX   Function that constructs a stiffness matrix.
%     S = ASSEMBLEMATRIX(ELMAT,XVEC,YVEC,REGION,D_AIR,D_MET) returns the
%     sparse stiffness matrix S for the diffusion part
%     D*(d^2c/dx^2+d^2c/dy^2) on the triangulation {ELMAT,XVEC,YVEC} with 
%     REGION-dependent diffusion with value D_AIR or D_MET.
%  
%     See also ASSEMBLEVECTOR, DIFFUSION, SPARSE, STIFFNESSELEMENTMATRIX.
% 
