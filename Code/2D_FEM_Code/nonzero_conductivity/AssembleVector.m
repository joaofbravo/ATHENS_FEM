%  ASSEMBLEVECTOR   Function that constructs a right hand side vector.
%     F = ASSEMBLEVECTOR(ELMAT,XVEC,YVEC,REGION,AMP,OMEGA,TIME) returns the
%     right hand side vector F for the source term on the
%     triangulation {ELMAT,XVEC,YVEC} with REGION-dependent amplitude, with
%     maximum amplitude AMP, period 2*PI/OMEGA at time TIME.
%  
%     See also ASSEMBLEMATRIX, SOURCE, SPARSE, ELEMENTVECTOR.
% 
