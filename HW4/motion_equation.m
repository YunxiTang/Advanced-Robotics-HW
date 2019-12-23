function [M, C, G] = motion_equation(x,P)
%MOTION_EQUATION of SYSTEM
%   Detailed explanation goes here
%   inputs: t--> time
%           x--> current state x = [q1;q2;q1d;q2d]
%           P--> system structure
M = zeros(2,2);
C = zeros(2,2);
G = zeros(2,1);

q1 = x(1);
q2 = x(2);
q1d = x(3);
q2d = x(4);

m1 = P.m1; m2 = P.m2;
L1 = P.L1; L2 = P.L2;
I = P.I; g = P.g;

M(1,1) = (m1+m2)*(L1)^2+I+m2*(L2)^2*(sin(q2))^2+I*(sin(q2))^2;
M(1,2) = m2*L1*L2*cos(q2);
M(2,1) = M(1,2);
M(2,2) = m2*(L2)^2+I;

C(1,1) = (m2*(L2)^2*sin(q2)*cos(q2)+I*sin(q2)*cos(q2))*q2d;
C(1,2) = (m2*(L2)^2*sin(q2)*cos(q2)+I*sin(q2)*cos(q2))*q1d + (-m2*L1*L2*sin(q2))*q2d;
C(2,1) = -(m2*(L2)^2*sin(q2)*cos(q2)+I*sin(q2)*cos(q2))*q1d;
C(2,2) = 0;

G(1,1) = 0;
G(2,1) = m2*g*L2*sin(q2);
end


