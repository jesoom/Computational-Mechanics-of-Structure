%
% Function mecpar: defines mechanical parameters
%
function [dPar,alpha]=mecpar

 % Matrix dPar:
 % collects Young's modulus and Poisson's coefficient for the material;
 % dPar=[E, ni]

  alpha=1.2e-5;
  dE=210000;
  dni=0.3;
  dPar=[dE, dni, alpha];

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
