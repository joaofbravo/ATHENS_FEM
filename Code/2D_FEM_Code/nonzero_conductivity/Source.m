%  SOURCE   Function which determines a source term.
%     SRCELEM = SOURCE(REGION,AMP,OMEGA,TIME) returns the souce term SRCELEM on the
%     current element in region REGION. SRCELEM either equals AMP*SIN(OMEGA*TIME), -AMP*SIN(OMEGA*TIME) or 0.
%  
%     See also DIFFUSION, CONDUCTIVITY.
% 
