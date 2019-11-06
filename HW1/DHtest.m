% This is do the corner test of DH table
clear all,clc;

%% Form DH table and generate transformation matrix
% The DH table of the manipulator
% +---+-----------+-----------+-----------+-----------+-----------+
% |  i|     theta |         d |         a |     alpha |    offset |
% +---+-----------+-----------+-----------+-----------+-----------+
% |  1|          0|         q1|          0|          0|        2*L|
% |  2|         q2|          0|          0|       pi/2|          0|
% |  3|         q3|          0|          L|      -pi/2|          0|
% |  4|         q4|          0|          0|       pi/2|       pi/2|
% |  5|         q5|  sqrt(2)*L|          0|       pi/4|          0|
% |  6|       pi/2|         q6|          0|       pi/4|          L|
% |Tip|          0|          0|          0|       pi/2|          0|
% +---+-----------+-----------+-----------+-----------+-----------+

% The length of link L is a constant, set its value here
L = 0.5;
qc = zeros(6,1);
%% DH params test
% to test whether the DH table is right or not
% Firstly, set qc as 0 vector, the frame of tip is
disp("Set qc as 0, T06 is");
T = Robot_Matrix(qc);
disp(T)

% set qc as qc = [0;pi/2;0;0;0;0], the frame of tip is
qc = [0;pi/2;0;0;0;0];
T = Robot_Matrix(qc);
disp("Set qc as [0;pi/2;0;0;0;0], T06 is");
disp(T);

% set qc as qc = [0;0;pi/2;0;0;0], the frame of tip is
qc = [0;0;pi/2;0;0;0];
T = Robot_Matrix(qc);
disp("Set qc as [0;0;pi/2;0;0;0], T06 is");
disp(T);

% set qc as qc = [0;0;0;pi/2;0;0], the frame of tip is
qc = [0;0;0;pi/2;0;0];
T = Robot_Matrix(qc);
disp("Set qc as [0;0;0;pi/2;0;0], T06 is");
disp(T);




