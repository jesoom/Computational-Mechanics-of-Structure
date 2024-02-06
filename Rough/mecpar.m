%
% Function mecpar: defines mechanical parameters
%
function [dPar,Alfa]=mecpar

 % Matrix dPar:
 % collects Young's modulus and Poisson's coefficient for the material;
 % dPar=[E, ni]

  Alfa=1.2e-5;
  dE=210000;
  dni=0.3;
  dPar=[dE, dni, Alfa];

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
