clc;
clear all;
flag=1;
syms E A I b alp dT h u v;
n = 45/28;
nDofTot = 12;
nElem = 3;

dXY  = [ 0    0
         b    0
         2*b  0
         b    n*b ];
     
dL = [ sqrt(b.^2+(n*b).^2) ; n*b ;sqrt(b.^2+(n*b).^2) ];
% 
  cosT = simplify(b/dL(1),'Steps',100);
  sinT = simplify(n*b/dL(1),'Steps',100);

eps1 = simplify((u*cosT + v*sinT)/dL(1))
eps2 = simplify(v/dL(2))
eps3 = simplify((-u*cosT + v*sinT)/dL(3))

dE1 = 0.5*E*A*dL(1)*eps1^2-E*A*dL(1)*alp*dT*eps1 + 0.5*E*A*dL(1)*(alp*dT).^2
dE2 = 0.5*E*A*dL(2)*eps2^2
dE3 = 0.5*E*A*dL(3)*eps3^2

dE = simplify(dE1 + dE2 + dE3)

diff(dE,u)
diff(dE,v)

u4 = solve(diff(dE,u),u)
v4 = simplify(solve(diff(dE,v),v))

u4s = subs(u4,[alp,b,dT],[1,1,1])
v4s = subs(v4,[alp,b,dT],[1,1,1])

N1 = simplify(E*A*subs(eps1-alp*dT,[u,v],[u4,v4]))
N1s = double(subs(N1,[E,A,alp,dT,b],[1,1,1,1,1]));
N2 = simplify(E*A*subs(eps2,[u,v],[u4,v4]))
N2s = double(subs(N2,[E,A,alp,dT,b],[1,1,1,1,1]));
N3 = simplify(E*A*subs(eps3,[u,v],[u4,v4]))
N3s = double(subs(N3,[E,A,alp,dT,b],[1,1,1,1,1]));

[N1s N2s N3s]


