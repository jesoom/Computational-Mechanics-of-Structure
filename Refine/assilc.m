%
% Function assilc: assigns boundary conditions (nodal loads and constraints)
%
function [nUs,dUs,nUu,dT]=assilc(nInc,nForce,dF,nCons,dC,npq,dpq,dXY,thickness,nDofTot,nGtot,dCsiEtaG,dWG,nEl,alpha,DeltaT,dEmat,dPar)
         
% Constrained displacements
% nUs=zeros([nCons,1]);
% dUs=zeros([nCons,1]);
% for nv=1:nCons
%   nn=dC(nc,1); %Number of constrained node 
%   ni=2*(nn-1)+dC(nc,2); %Constrained dof
%   nUs(nc,1)=ni; %Collects the constrained dof in vector nUs
%   dUs(nc,1)=dCs(nc,3); %Collects the imposed displacement in vector dUs
% end
% All together: 
  nUs=2*dC(:,1)-2*ones([nCons,1])+dC(:,2);
  dUs=dC(:,3);

% Sorts constrained dofs and corresponding imposed displacements
 [nUs,nI]=sort(nUs);
 dUs=dUs(nI,1);

% Free (unconstrained) Dofs
 nUu=[1:nDofTot]';
 nUu(nUs)=[];

% Known terms in the unconstrained structures
 dT=zeros([nDofTot,1]);

% Collect force components in vector dT
 for nf=1:nForce
   nn=dF(nf,1); % Number of loaded node 
   ni=2*(nn-1)+dF(nf,2); % Loaded Dof
   dT(ni,1)=dT(ni,1)+dF(nf,3);

 end
%   dBneT=dBne';

%computation of the thermal forces at nodes
 if DeltaT ~=0
     
     epsT=alpha*DeltaT*[1;1;0];
     
       for i=1:1:nEl   
           
       dtherm=zeros([8,1]); 
       n14=nInc(i,1:4);
       dXnodes=dXY(n14,1);
       dYnodes=dXY(n14,2);
     
            for ng=1:nGtot % nodal thermal forces for one element 
            dxg=dCsiEtaG(ng,1);
            dyg=dCsiEtaG(ng,2);
            dPhi=[(1-dxg)*(1-dyg); (1+dxg)*(1-dyg); (1+dxg)*(1+dyg); (1-dxg)*(1+dyg)]/4;
            dPhidCsi=[-(1-dyg);  (1-dyg); (1+dyg); -(1+dyg)]/4;
            dPhidEta=[-(1-dxg); -(1+dxg); (1+dxg);  (1-dxg)]/4;

            dQmat=dPhidCsi*dPhidEta'-dPhidEta*dPhidCsi';
            ddJ=dXnodes'*dQmat*dYnodes;

            dE=dPar(1);
            dni=dPar(2);
            dG=dE/2/(1+dni);


            dBne=zeros([3,8]);
            dBne(1,1:2:end)=-dYnodes'*dQmat;
            dBne(2,2:2:end)= dXnodes'*dQmat;
            dBne(3,1:2:end)=dBne(2,2:2:end);
            dBne(3,2:2:end)=dBne(1,1:2:end);
            dBne=dBne/ddJ;
            dBneT=dBne';


            dQmat=dPhidCsi*dPhidEta'-dPhidEta*dPhidCsi';
            ddJ=dXnodes'*dQmat*dYnodes;


            dtherm(1:2:end,1)=dtherm(1:2:end,1)+dWG(ng)*thickness*dBneT(1:2:end,:)*dEmat*epsT*abs(ddJ);  %x
            dtherm(2:2:end,1)=dtherm(2:2:end,1)+dWG(ng)*thickness*dBneT(2:2:end,:)*dEmat*epsT*abs(ddJ);  %y


            end 
     nVne=nInc(i,5:12);
     dT(nVne,1)=dT(nVne,1)+dtherm;
     end 
 end                            
    
%  dBneT=dBne';
 if npq>0
 % Distributed (uniform) loads
   for nf=1:npq
     ne=dpq(nf,1); % Number of loaded element 
     n14=nInc(ne,1:4);
     dXnodes=dXY(n14,1);
     dYnodes=dXY(n14,2);

     dTpq=zeros([8,1]);
     for ng=1:nGtot
       dxg=dCsiEtaG(ng,1);
       dyg=dCsiEtaG(ng,2);
       dPhi=[(1-dxg)*(1-dyg); (1+dxg)*(1-dyg); (1+dxg)*(1+dyg); (1-dxg)*(1+dyg)]/4;
       dPhidCsi=[-(1-dyg);  (1-dyg); (1+dyg); -(1+dyg)]/4;
       dPhidEta=[-(1-dxg); -(1+dxg); (1+dxg);  (1-dxg)]/4;

       dQmat=dPhidCsi*dPhidEta'-dPhidEta*dPhidCsi';
       ddJ=dXnodes'*dQmat*dYnodes;

       dTpq(1:2:end,1)=dTpq(1:2:end,1)+dWG(ng)*thickness*dPhi*dpq(nf,2)*abs(ddJ);   
       dTpq(2:2:end,1)=dTpq(2:2:end,1)+dWG(ng)*thickness*dPhi*dpq(nf,3)*abs(ddJ);   
     end
     nVne=nInc(ne,5:12);
     dT(nVne,1)=dT(nVne,1)+dTpq;
   end
 end
 % dThermic(1:end,1)=dThermic(1:1:end,1)+dWG(ng)*thickness*dBneT*dEmat*epsT*abs(ddJ); 
 %          dEmat=inv([   1/dE, -dni/dE,    0;
%              -dni/dE,    1/dE,    0;
%              0,       0, 1/dG]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
