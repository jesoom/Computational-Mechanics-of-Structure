%
% Function geotop: defines geometry and topology data
%
function [nInc,nElements,dXY,nNodes,nEl]=geotop

% Matrix of the nodal coordinates dXY:
% the n-th row in dXY collects the nodal coordinates of node i-th 
% dXY(n,:)=[x coordinate of n-th node,  y coordinate of n-th node]

  B=17.1875;
  C=20;
  D=9.375;
  E=7.5;
  F=11.25;
  dXY=[  0,           0; % 1st row
         B,           0;
         2*B,         0;
         3*B,         0;
         4*B,         0;
         4*B+D,       0;
         4*B+2*D,     0;
         0,           C; % 2nd row
         B,           C;
         2*B,         C;
         3*B,         C;
         4*B,         C;
         4*B+D,       C;
         4*B+2*D,     C;
         0,           2*C; % 3rd row
         B,           2*C;
         2*B,         2*C;
         3*B,         2*C;
         4*B,         2*C;
         4*B+D,       2*C;
         4*B+2*D,     2*C;
         0,           2*C+E; % 4rd row
         B,           2*C+E;
         2*B,         2*C+E;
         3*B,         2*C+E;
         4*B,         2*C+E;
         4*B+D,       2*C+E;
         4*B+2*D,     2*C+E;
         0,           2*C+2*E; % 5rd row
         B,           2*C+2*E;
         2*B,         2*C+2*E;
         3*B,         2*C+2*E;
         4*B,         2*C+2*E;
         4*B+D,       2*C+2*E;
         4*B+2*D,     2*C+2*E;
         4*B+3*D,     2*C+2*E;
         4*B+4*D,     2*C+2*E;
         4*B+5*D,     2*C+2*E;
         4*B+6*D,     2*C+2*E;
         0,           2*C+2*E+F; % 6rd row
         B,           2*C+2*E+F;
         2*B,         2*C+2*E+F;
         3*B,         2*C+2*E+F;
         4*B,         2*C+2*E+F;
         4*B+D,       2*C+2*E+F;
         4*B+2*D,     2*C+2*E+F;
         4*B+3*D,     2*C+2*E+F;
         4*B+4*D,     2*C+2*E+F;
         4*B+5*D,     2*C+2*E+F;
         4*B+6*D,     2*C+2*E+F;
         0,           2*C+2*E+2*F; % 7rd row
         B,           2*C+2*E+2*F;
         2*B,         2*C+2*E+2*F;
         3*B,         2*C+2*E+2*F;
         4*B,         2*C+2*E+2*F;
         4*B+D,       2*C+2*E+2*F;
         4*B+2*D,     2*C+2*E+2*F;
         4*B+3*D,     2*C+2*E+2*F;
         4*B+4*D,     2*C+2*E+2*F;
         4*B+5*D,     2*C+2*E+2*F;
         4*B+6*D,     2*C+2*E+2*F;
         0,           3*C+2*E+2*F; % 8rd row
         B,           3*C+2*E+2*F;
         2*B,         3*C+2*E+2*F;
         3*B,         3*C+2*E+2*F;
         4*B,         3*C+2*E+2*F;
         4*B+D,       3*C+2*E+2*F;
         4*B+2*D,     3*C+2*E+2*F;
         4*B+3*D,     3*C+2*E+2*F;
         4*B+4*D,     3*C+2*E+2*F;
         4*B+5*D,     3*C+2*E+2*F;
         4*B+6*D,     3*C+2*E+2*F;
         0,           4*C+2*E+2*F; % 9rd row
         B,           4*C+2*E+2*F;
         2*B,         4*C+2*E+2*F;
         3*B,         4*C+2*E+2*F;
         4*B,         4*C+2*E+2*F;
         4*B+D,       4*C+2*E+2*F;
         4*B+2*D,     4*C+2*E+2*F;
         4*B+3*D,     4*C+2*E+2*F;
         4*B+4*D,     4*C+2*E+2*F;
         4*B+5*D,     4*C+2*E+2*F;
         4*B+6*D,     4*C+2*E+2*F;
         0,           5*C+2*E+2*F; % 10rd row
         B,           5*C+2*E+2*F;
         2*B,         5*C+2*E+2*F;
         3*B,         5*C+2*E+2*F;
         4*B,         5*C+2*E+2*F;
         4*B+D,       5*C+2*E+2*F;
         4*B+2*D,     5*C+2*E+2*F;
         4*B+3*D,     5*C+2*E+2*F;
         4*B+4*D,     5*C+2*E+2*F;
         4*B+5*D,     5*C+2*E+2*F;
         4*B+6*D,     5*C+2*E+2*F;
         0,           6*C+2*E+2*F; % 11rd row
         B,           6*C+2*E+2*F;
         2*B,         6*C+2*E+2*F;
         3*B,         6*C+2*E+2*F;
         4*B,         6*C+2*E+2*F;
         4*B+D,       6*C+2*E+2*F;
         4*B+2*D,     6*C+2*E+2*F;
         4*B+3*D,     6*C+2*E+2*F;
         4*B+4*D,     6*C+2*E+2*F;
         4*B+5*D,     6*C+2*E+2*F;
         4*B+6*D,     6*C+2*E+2*F;
         0,           7*C+2*E+2*F; % 12rd row
         B,           7*C+2*E+2*F;
         2*B,         7*C+2*E+2*F;
         3*B,         7*C+2*E+2*F;
         4*B,         7*C+2*E+2*F;
         4*B+D,       7*C+2*E+2*F;
         4*B+2*D,     7*C+2*E+2*F;
         4*B+3*D,     7*C+2*E+2*F;
         4*B+4*D,     7*C+2*E+2*F;
         4*B+5*D,     7*C+2*E+2*F;
         4*B+6*D,     7*C+2*E+2*F;
         0,           8*C+2*E+2*F; % 13rd row
         B,           8*C+2*E+2*F;
         2*B,         8*C+2*E+2*F;
         3*B,         8*C+2*E+2*F;
         4*B,         8*C+2*E+2*F;
         4*B+D,       8*C+2*E+2*F;
         4*B+2*D,     8*C+2*E+2*F;
         4*B+3*D,     8*C+2*E+2*F;
         4*B+4*D,     8*C+2*E+2*F;
         4*B+5*D,     8*C+2*E+2*F;
         4*B+6*D,     8*C+2*E+2*F;         
          ]; 
 %Total number of nodes
  [nNodes,nn]=size(dXY);  

 % Connection matrix nInc
 % the n-th row of nInc contains the node numbers for the n-th finite element (INPUT DATA)
 % and the corresponding dofs (evaluated from the former INPUT)
 % nInc(ne,:)=[n1, n2, n3, n4, n1u, n1v, n2u, n2v, n3u, n3v, n4u, n4v] 

  nInc=[  1,     2,    9,    8;
          2,     3,    10,   9;
          3,     4,    11,   10;
          4,     5,    12,   11;
          5,     6,    13,   12;
          6,     7,    14,   13;
          8,     9,    16,   15;
          9,     10,   17,   16;
          10,    11,   18,   17;
          11,    12,   19,   18;
          12,    13,   20,   19;
          13,    14,   21,   20;
          15,    16,   23,   22;
          16,    17,   24,   23;
          17,    18,   25,   24;
          18,    19,   26,   25;
          19,    20,   27,   26;
          20,    21,   28,   27;
          22,    23,   30,   29;
          23,    24,   31,   30;
          24,    25,   32,   31;
          25,    26,   33,   32;
          26,    27,   34,   33;
          27,    28,   35,   34;
          29,    30,   41,   40;
          30,    31,   42,   41;
          31,    32,   43,   42;
          32,    33,   44,   43;
          33,    34,   45,   44;
          34,    35,   46,   45;
          35,    36,   47,   46;
          36,    37,   48,   47;
          37,    38,   49,   48;
          38,    39,   50,   49;
          40,    41,   52,   51;
          41,    42,   53,   52;
          42,    43,   54,   53;
          43,    44,   55,   54;
          44,    45,   56,   55;
          45,    46,   57,   56;
          46,    47,   58,   57;
          47,    48,   59,   58;
          48,    49,   60,   59;
          49,    50,   61,   60;
          51,    52,   63,   62;
          52,    53,   64,   63;
          53,    54,   65,   64;
          54,    55,   66,   65;
          55,    56,   67,   66;
          56,    57,   68,   67;
          57,    58,   69,   68;
          58,    59,   70,   69;
          59,    60,   71,   70;
          60,    61,   72,   71;
          62,    63,   74,   73;
          63,    64,   75,   74;
          64,    65,   76,   75;
          65,    66,   77,   76;
          66,    67,   78,   77;
          67,    68,   79,   78;
          68,    69,   80,   79;
          69,    70,   81,   80;
          70,    71,   82,   81;
          71,    72,   83,   82;
          73,    74,   85,   84;
          74,    75,   86,   85;
          75,    76,   87,   86;
          76,    77,   88,   87;
          77,    78,   89,   88;
          78,    79,   90,   89;
          79,    80,   91,   90;
          80,    81,   92,   91;
          81,    82,   93,   92;
          82,    83,   94,   93;          
          84,    85,   96,   95;
          85,    86,   97,   96;
          86,    87,   98,   97;
          87,    88,   99,   98;
          88,    89,   100,  99;
          89,    90,   101,  100;
          90,    91,   102,  101;
          91,    92,   103,  102;
          92,    93,   104,  103;
          93,    94,   105,  104;
          95,    96,   107,  106;
          96,    97,   108,  107;
          97,    98,   109,  108;
          98,    99,   110,  109;
          99,   100,   111,  110;
          100,  101,   112,  111;
          101,  102,   113,  112;
          102,  103,   114,  113;
          103,  104,   115,  114;
          104,  105,   116,  115;
          106,  107,   118,  117;
          107,  108,   119,  118;
          108,  109,   120,  119;
          109,  110,   121,  120;
          110,  111,   122,  121;
          111,  112,   123,  122;
          112,  113,   124,  123;
          113,  114,   125,  124;
          114,  115,   126,  125;
          115,  116,   127,  126;
          
      
          ];

  nInc=[nInc,nInc(:,1)*2-1,nInc(:,1)*2,nInc(:,2)*2-1,nInc(:,2)*2,nInc(:,3)*2-1,nInc(:,3)*2,nInc(:,4)*2-1,nInc(:,4)*2];
   
 %Total number of plane elements in the structure
  [nElements,nn]=size(nInc);
  nEl=nElements;
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
