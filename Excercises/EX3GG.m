clear all
close all
clc

format shorteng
syms l E I A alpha dt h chi H1 V1 W1 H2 V2 W2 H3 V3 W3 u1 v1 fi1 u2 v2 fi2 u3 v3 fi3 x

% l=10;
% E=1000;
% I=1;
% alpha=1;
% dt=200;
% h=1;
% A=1;

chi=alpha*dt/h;
eta=alpha*dt/2;

e=3; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=0; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n1=1+2*e;
n2=20-2*f;
k2=n1*E*I/l^3;
k3=n2*E*I/l^3;

KH=2*E*A/l*[1 -1 0;-1 2 -1;0 -1 1];

u1=0;
v1=0;
eqns1= [H1;H2;H3]+E*A*eta*[0;-1;1] == KH*[0;u2;u3];
[u2 u3 H1 H2 H3]= solve (eqns1,u2,u3,H1,H2,H3);


K=(8*E*I/l^3)*[  12		3*l		   -12		 3*l	      0		     0	
                 3*l	 l^2	  -3*l	   0.5*l^2	      0		     0	
                -12		-3*l	    24		  0		     -12         3*l
                 3*l	0.5*l^2 	0		 2*l^2	     -3*l	   0.5*l^2
                  0		 0		   -12		-3*l	      12		-3*l
                  0		 0		   3*l	   0.5*l^2	     -3*l	    l^2];

th=E*I*chi*[0;0;0;-1;0;1];

eqns= [V1;W1;V2;0;V3;0]+th== K*[0;0;-V2/k2;fi2;-V3/k3;fi3];
[V1 W1 V2 V3 fi2 fi3  ]= solve (eqns,[V1 W1 V2 V3 fi2 fi3]);

fi1=0;
v2=-V2/k2;
v3=-V3/k3;
W2=0;
W3=0;
REACTIONS=eval([H1;V1;W1;H2;V2;W2;H3;V3;W3])
DISPLACEMENTS=eval([u1;v1;fi1;u2;v2;fi2;u3;v3;fi3])

%Shape functions

Lu1=1-2*x/l;
Lu2sx=2*x/l;

Lu2dx=1-2*x/l;
Lu3=2*x/l;

usx= u1*Lu1+u2*Lu2sx;
udx= u2*Lu2dx+u3*Lu3;

dusx=diff(usx);
dudx=diff(udx);

Bv1=12*x/((0.5*l)^3)-6/((0.5*l)^2);
Bfi1=6*x/((0.5*l)^2)-4/(0.5*l);
Bv2=-12*x/((0.5*l)^3)+6/((0.5*l)^2);
Bfi2=6*x/((0.5*l)^2)-2/(0.5*l);

ddv1=v1*Bv1+fi1*Bfi1+v2*Bv2+fi2*Bfi2;
ddv2=v2*Bv1+fi2*Bfi1+v3*Bv2+fi3*Bfi2;

E_H=0.5*E*A*int(dusx^2,x,0,0.5*l)+0.5*E*A*int((dudx-eta)^2,x,0,0.5*l)
E_V=0.5*E*I*int(ddv1^2,x,0,0.5*l)+0.5*E*I*int((ddv2-chi)^2,x,0,0.5*l)+0.5*k2*v2^2+0.5*k3*v3^2

Energy=E_H+E_V
