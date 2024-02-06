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
  dC=[117,1,0;
      117,2,0;
      118,1,0;
      118,2,0;
      119,1,0;
      119,2,0;
      120,1,0;
      120,2,0;
      121,1,0;
      121,2,0;
      122,1,0;
      122,2,0;
      123,1,0;
      123,2,0;
      124,1,0;
      124,2,0;
      125,1,0;
      125,2,0;
      126,1,0;
      126,2,0;
      127,1,0;
      127,2,0;
      116,1,0;
      105,1,0;
      94,1,0;
      83,1,0;
      72,1,0;
      61,1,0;
      50,1,0;
      39,1,0;
      1,2,0;
      2,2,0;
      3,2,0;
      4,2,0;
      5,2,0;
      6,2,0;
      7,2,0;
      ];

  [nCons,nn]=size(dC);  % nCons=total number of constrained dofs
  
 % Distributed load matrix dpq: 
 % the i-th row of dpq collects: the number of the loaded element; 
 %                               the uniform load in x direction; 
 %                               the uniform load in y direction.

  dpq=[];
  
  [npq,nn]=size(dpq);  % npq=total number of considered loads

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
