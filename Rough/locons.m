%
% Function locons: defines boundary conditions (loads and constraints)
%
function [nCons,dC,nForce,dF,npq,dpq,dt]=locons

 % Load matrix dF: 
 % the i-th row of dF collects: the number of the loaded node; 
 %                                      the force direction; 
 %                                      the force intensity.
 % dF(i,1)=node number;
 % dF(i,2)=loaded direction ("1" along "x", "2" along "y");
 % dF(i,3)=action intensity.

 % dF=[1,1,10000];
 
  dF=[];
  
  [nForce,nn]=size(dF);  % nForce=total number of considered loads

 % Constraint matrix dC: 
 % the i-th row in dC collects: the number of the constrained node; 
 %                                      the direction of the constrained dof; 
 %                                      the magnitude of the imposed displacement.
 % dC(i,1)=node number;
 % dC(i,2)=constrained dof ("1" along "x", "2" along "y");
 % dC(i,3)=magnitude of the imposed displacement.

dt=30;
  dC=[33,1,0;
      33,2,0;
      34,1,0;
      34,2,0;
      35,1,0;
      35,2,0;
      36,1,0;
      36,2,0;
      37,1,0;
      37,2,0;
      38,1,0;
      38,2,0;
      32,1,0;
      26,1,0;
      20,1,0;
      14,1,0;
      1,2,0;
      2,2,0;
      3,2,0;
      4,2,0;];

  [nCons,nn]=size(dC);  % nCons=total number of constrained dofs
  
 % Distributed load matrix dpq: 
 % the i-th row of dpq collects: the number of the loaded element; 
 %                               the uniform load in x direction; 
 %                               the uniform load in y direction.

  dpq=[];
  
  [npq,nn]=size(dpq);  % npq=total number of considered loads

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
