clc;
clear all;
flag=2;
syms E A L I alp dTL h;
e = 2; f = 1;
n1 = 1+2*e;
n2 = 20-2*f;
k1 = n1*E*I/L^3;
k2 = n2*E*I/L^3;
nDofTot = 9;
nElem = 2;

dXY  = [ 0    0
         L/2  0
         L    0 ];
     
nInc = [ 1  2   1   2   3   4   5   6
         2  3   4   5   6   7   8   9 ];
     
dC   = [ 1  1 
         1  2 
         1  3  
         ];
     
dPar = [ E   A   I
         E   A   I ];
dL = [ L/2 ; L/2 ];
     
dK=zeros([nDofTot,nDofTot]).* A;
  for ne=1:nElem
        n12=nInc(ne,1:2);
        dXY12=dXY(n12,:);
        dParne=dPar(ne,:);
        dLne = dL(ne);
        [dKne]=stiffm(dXY12,dParne,dLne,A,flag);
        nVne=nInc(ne,3:8);                  
        dK(nVne,nVne)= dK(nVne,nVne)+dKne;
  end
  dK(5,5)= dK(5,5)+k1;
  dK(8,8)= dK(8,8)+k2;
  
  Qt = E*A*alp*dTL/2* [ 0
                        0
                        0
                        -1
                        0
                        0
                        1
                        0
                        0 ];
  Qt =Qt+ E*I*alp*dTL/h* [ 0
                        0
                        0
                        0
                        0
                        -1
                        0
                        0
                        1 ];
  
  nUs=dC(:,2);
  [nUs,nI]=sort(nUs);
  nUu=(1:nDofTot)';
  nUu(nUs)=[];
  dKuu=dK(nUu,nUu);
  dKus=dK(nUu,nUs);
  dKsu=dK(nUs,nUu);
  dKss=dK(nUs,nUs);
  
  dT = Qt;
  dTu=dT(nUu,1);
  dTs=dT(nUs,1);
    
  % Computing unknown displacements 
  dUu=dKuu\(dTu);
  % Computing reaction forces
  dRs=dKsu*dUu-dTs;
  
  % Recovering nodal displacements following the original dof numbering
  du=zeros([nDofTot,1])*A;
  du(nUu,1)=dUu

% Recovering reaction forces in the original dof numbering
  dR=zeros([nDofTot,1])*A;
  dR(nUs,1)=dRs;
  dR(5) = - k1*du(5)
  dR(8) = - k2*du(8)
% 
% syms C2 N2 A;
% U2d = alp*dT*x2/2+ N2/(E*A);
% U2 = int(U2d)+C2;
% [C2s N2s]= solve(subs(U2,x2,0)==0,subs(U2,x2,L/2)==0,[C2,N2]);
% % Energy
%   duT(1,1:9)=du;

EE=0.5*du'*dK*du;
EE=vpa(simplify(EE),4)