clc; clear all; close all;
syms EA   EI b ;
f=0;
n2=(11+f)/10;
b2=n2*b



F=[ EA/b  0          0           -EA/b          0              0              0                0             0            0;
    0     12*EI/b^3  6*EI/b^2     0            -12*EI/b^3      0              6*EI/b^2         0             0            0;
    0     6*EI/b^2   4*EI/b       0            -6*EI/b^2       0              2*EI/b           0             0            0;
   -EA/b  0          0            EA/b+EA/b2    0              0              0                -EA/b2        0            0;
    0     -12*EI/b^3 -6*EI/b^2    0             12*EI/b^3      0              -6*EI/b^2        0             0            0;
    0     0          0            0             0              12*EI/b2^3     6*EI/b2^2        0             -12*EI/b2^3  6*EI/b2^2;
    0     6*EI/b^2   2*EI/b       0             -6*EI/b^2      6*EI/b2^2      4*EI/b+4*EI/b2   0             -6*EI/b2^2   2*EI/b2;
    0     0          0            -EA/b2        0              0              0                EA/b2         0            0;
    0     0          0            0             0              -12*EI/b2^3    -6*EI/b2^2       0             12*EI/b2^3   -6*EI/b2^2;
    0     0          0            0             0              6*EI/b2^2      2*EI/b2          0             -6*EI/b2^2   4*EI/b2    ]


% 
% REDc=F
% REDc(1:2,:)=[];
% REDc(7,:)=[]
% REDc(:,1:2)=[]
% REDc(:,7)=[]


REDc=F;
REDd=F;
REDc(1:2,:)=[];
REDc(7,:)=[];
REDc(:,1:2)=[];
REDc(:,7)=[];
rank(F);

REDd(1:2,:)=[];
REDd(7:8,:)=[];
REDd(:,1:2)=[];
REDd(:,7:8)=[];
REDc
REDd
rank(REDc)
rank(REDd)


 