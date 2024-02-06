clear 
close all
format short

e=1;
f=9;
n1=1+2*e;
n2=20-2*f;
EA=1;
EI=1;
l=1;
k1=n1*EI/l^3;
k2=n2*EI/l^3;
deltaT=1;
alfa=1;
h=1;

S11=l^3/(24*EI)+1/k1;
S22=l^3/(3*EI)+1/k2;
S12=5*l^3/(48*EI);
d1t=0;
d2t=alfa*deltaT*l^2/(8*h);
S=[S11,S12;
   S12,S22;];
X=S\[0,-d2t]';
XA=-X(1,1)-X(2,1);
a1=-(X(1,1)+X(2,1));
b1=(X(2,1)*l+0.5*X(1,1)*l);
a2=-X(2,1);
b2=X(2,1)*l*0.5;
c= (a1*l^2/8+0.5*b1*l)/EI;
d=(a1*l^3/48+b1*l^2/8)/EI;
vB=d;
fB=c;
vC=(a2*l^3/48+b2*l^2/8)/EI+alfa*deltaT*l^2/(8*h)+c*l*0.5+d;
fC=(a2*l^2/8+b2*l*0.5)/EI+alfa*deltaT*0.5*l/h+c;
E=0.5*k1*vB^2+0.5*k2*vC^2+0.5*(((0.5*a1+b1)^3-b1^3)/(3*a1))+0.5*(((0.5*a2+b2)^3-b2^3)/(3*a2));

MA=-(X(1,1)*0.5+X(2,1));
MB=-X(2,1)*0.5;
T1=(MA-MB)*2;
T2=MB*2;




