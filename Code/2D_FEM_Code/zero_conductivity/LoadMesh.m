%  LOADMESH   Function which loads a stored mesh.
%     [ELMAT,XVEC,YVEC,REGION] = LOADMESH(MESH) returns the triangulation
%     {ELMAT,XVEC,YVEC}  of the physical domain used in this project and the 
%     REGIONs in this domain. MESH must be either 'fine', 'medium' or 
%     'coarse', in which case it returns the corresponding mesh.
%  
%     If MESH does not equal one of these options, it loads the file MESH.mat
%     in which you should have put the triangulation of your choice.
%  
%     See also LOAD.
% 
