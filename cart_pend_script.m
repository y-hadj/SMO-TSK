clc
clear all

%data
x0=[0.6; 0; 0.1; 0];
uc=0.005;
m=2;
l=0.5;
g=9.81;
M=8;
a=1/(M+m);


%local lin models
A1=[0 1 0 0; -17.31 0 0 0; 0 0 0 1; 1.7312 0 0 0];
A2=[0 1 0 0; -14.32 0 0 0; 0 0 0 1; 0.716 0 0 0];

B1=[0; -0.1765; 0; 0.1176];
B2=[0; -0.1147; 0; 0.1081];

C=[1 0 0 0; 0 0 1 0; 0 0 0 1];


%sm obs
Gl=[4 0 -1.5; -14.31 0 -6; 0 2 1; 1.73 0 4];
Gnl=[0.1176 0 0; 0.3529 0 -0.1765; 0 0.1176 0; 0 0 0.1176];

Q=eye(3);
As1=[-1 0 0; 0 -2 0; 0 0 -4];
P2=lyap(As1,Q);


%lqr command
K1=place(A1,B1,[-1 -2 -3 -4]');
K2=place(A2,B2,[-1.5 -2.5 -3.5 -4.5]');

Abf1=A1-B1*K1;
Abf2=A2-B2*K2;

Q=eye(4);
R=10;
N=zeros(4,1);

KK1=lqr(Abf1,B1,Q,R,N);
KK2=lqr(Abf2,B1,Q,R,N);