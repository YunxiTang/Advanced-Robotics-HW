% This is to calculate the Jacobian Matrix for manipulator
clear all;
clc;

%% Joint variables
q1 = sym('q1');
q2 = sym('q2');
q3 = sym('q3');
q4 = sym('q4');
q5 = sym('q5');
q6 = sym('q6');
L = sym('L');

%% Transformation matrixs of each Joint
T01 = [1 0 0 0;
       0 1 0 0;
       0 0 1 2*L+q1;
       0 0 0 1];
T12 = [cos(q2) -sin(q2) 0  0;
       0       0        -1 0;
       sin(q2) cos(q2)  0  0;
       0       0        0  1];
T23 = [cos(q3) -sin(q3) 0 L;
       0       0        1 0;
       -sin(q3) -cos(q3) 0 0;
       0       0         0 1];
T34 = [-sin(q4) -cos(q4) 0  0;
       0        0        -1 0;
       cos(q4) -sin(q4)  0  0;
       0        0        0 1];
T45 = [cos(q5)           -sin(q5)          0          0;
       sqrt(2)/2*sin(q5) sqrt(2)/2*cos(q5) -sqrt(2)/2 -L;
       sqrt(2)/2*sin(q5) sqrt(2)/2*cos(q5) sqrt(2)/2  L;
       0                 0                 0          1];
T56 = [0          -1     0             0;
       sqrt(2)/2   0     -sqrt(2)/2    -sqrt(2)/2*(L+q6);
       sqrt(2)/2   0     sqrt(2)/2     sqrt(2)/2*(L+q6);
       0           0     0             1];
T02 = T01*T12;
T03 = T02*T23;
T04 = T03*T34;
T05 = T04*T45;
T06 = T05*T56;

%% Poistion of each Joint in the frame {0}
P1 = T01(1:3,4);
P2 = T02(1:3,4);
P3 = T03(1:3,4);
P4 = T04(1:3,4);
P5 = T05(1:3,4);
P6 = T06(1:3,4);

%% Direction Vector of each Joint in the frame {0}
Z1 = T01*[0; 0; 1; 0]; Z1 = Z1(1:3);
Z2 = T02*[0; 0; 1; 0]; Z2 = Z2(1:3);
Z3 = T03*[0; 0; 1; 0]; Z3 = Z3(1:3);
Z4 = T04*[0; 0; 1; 0]; Z4 = Z4(1:3);
Z5 = T05*[0; 0; 1; 0]; Z5 = Z5(1:3);
Z6 = T06*[0; 0; 1; 0]; Z6 = Z6(1:3);

%% Jacobian Matrix 
J = [Z1 cross(Z2,(P6-P2)) cross(Z3,(P6-P3))...
    cross(Z4,(P6-P4)) cross(Z5,(P6-P5)) Z6;
    [0;0;0]  Z2           Z3            Z4 ...
    Z5                [0;0;0]];
disp('Jacobian Matrix is:');
disp(J);





