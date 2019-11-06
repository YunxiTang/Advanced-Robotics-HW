clear all;
clc;
%% Forward kinematics
% Links
% q1 = sym('q1');
% q2 = sym('q2');
% q3 = sym('q3');
q = [pi/4;0;-pi/4];
q1 = q(1);
q2 = q(2);
q3 = q(3);
Tb0 = TransMatrix(q1,1,0,0);
T01 = TransMatrix(q2,0,0,-pi/2);
T12 = TransMatrix(q3,0,1,0);
T2tip = TransMatrix(0,0,1,0);

% Joint 0
% Tb0 = TransMatrix(q1,1,0,0);
Z0 = Tb0(1:3,3);
P0 = Tb0(1:3,4);

% Joint 1
Tb1 = Tb0*T01;
Z1 = Tb1(1:3,3);
P1 = Tb1(1:3,4);

% Joint 2
Tb2 = Tb1*T12;
Z2 = Tb2(1:3,3);
P2 = Tb2(1:3,4);

% Tip
Tbtip = Tb2*T2tip;
Ztip = Tbtip(1:3,3);
Ptip = Tbtip(1:3,4);

%% Jacobian Matrix
J = [cross(Z0,(Ptip-P0)) cross(Z1,(Ptip-P1)) cross(Z2,(Ptip-P2))];



