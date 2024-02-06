%
% Function geotop: defines geometry and topology data
%
function [nInc,nElements,dXY,nNodes,nEl]=geotop

% Matrix of the nodal coordinates dXY:
% the n-th row in dXY collects the nodal coordinates of node i-th 
% dXY(n,:)=[x coordinate of n-th node,  y coordinate of n-th node]

  B=34.375;
  C=40;
  D=18.75;
  E=15;
  F=22.5;
  dXY=[  0,           0; % 1st row
         B,           0;
         2*B,         0;
         2*B+D,       0;
         0,           C; % 2nd row
         B,           C;
         2*B,         C;
         2*B+D,       C;
         0,           C+E; % 3rd row
         B,           C+E;
         2*B,         C+E;
         2*B+D,       C+E;
         2*B+2*D,     C+E;
         2*B+3*D,     C+E;
         0,           C+E+F; % 4rd row
         B,           C+E+F;
         2*B,         C+E+F;
         2*B+D,       C+E+F;
         2*B+2*D,     C+E+F;
         2*B+3*D,     C+E+F;
         0,           2*C+E+F; % 5rd row
         B,           2*C+E+F;
         2*B,         2*C+E+F;
         2*B+D,       2*C+E+F;
         2*B+2*D,     2*C+E+F;
         2*B+3*D,     2*C+E+F;
         0,           3*C+E+F; % 6rd row
         B,           3*C+E+F;
         2*B,         3*C+E+F;
         2*B+D,       3*C+E+F;
         2*B+2*D,     3*C+E+F;
         2*B+3*D,     3*C+E+F;
         0,           4*C+E+F; % 7rd row
         B,           4*C+E+F;
         2*B,         4*C+E+F;
         2*B+D,       4*C+E+F;
         2*B+2*D,     4*C+E+F;
         2*B+3*D,     4*C+E+F;
          ]; 
 %Total number of nodes
  [nNodes,nn]=size(dXY);  

 % Connection matrix nInc
 % the n-th row of nInc contains the node numbers for the n-th finite element (INPUT DATA)
 % and the corresponding dofs (evaluated from the former INPUT)
 % nInc(ne,:)=[n1, n2, n3, n4, n1u, n1v, n2u, n2v, n3u, n3v, n4u, n4v] 

  nInc=[  1,    2,   6,   5;
          2,    3,   7,   6;
          3,    4,   8,   7;
          5,    6,   10,  9;
          6,    7,   11,  10;
          7,    8,   12,  11;
          9,    10,  16,  15;
          10,   11,  17,  16;
          11,   12,  18,  17;
          12,   13,  19,  18;
          13,   14,  20,  19;
          15,   16,  22,  21;
          16,   17,  23,  22;
          17,   18,  24,  23;
          18,   19,  25,  24;
          19,   20,  26,  25;
          21,   22,  28,  27;
          22,   23,  29,  28;
          23,   24,  30,  29;
          24,   25,  31,  30;
          25,   26,  32,  31;
          27,   28,  34,  33;
          28,   29,  35,  34;
          29,   30,  36,  35;
          30,   31,  37,  36;
          31,   32,  38,  37;
                   ];

  nInc=[nInc,nInc(:,1)*2-1,nInc(:,1)*2,nInc(:,2)*2-1,nInc(:,2)*2,nInc(:,3)*2-1,nInc(:,3)*2,nInc(:,4)*2-1,nInc(:,4)*2];
   
 %Total number of plane elements in the structure
  [nElements,nn]=size(nInc);
  nEl=nElements;
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

