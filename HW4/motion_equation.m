function [M, C, G] = motion_equation(x,P)
%MOTION_EQUATION of SYSTEM
%   Detailed explanation goes here
%   inputs: t--> time
%           x--> current state x = [q1;q2;q1d;q2d]
%           P--> system structure
M = zeros(2,2);
C = zeros(2,2);
G = zeros(2,1);

l1 = P.l1;
m1 = P.m1;
m2 = P.m2;
I1 = P.I1;
g = P.g;

q1 = x(1,:);
q2 = x(2,:);

dq1 = x(3,:);
dq2 = x(4,:);

M(1,1) = 1/4*m1*l1*l1+I1+(l1*l1+q2*q2)*m2;
M(1,2) = -m2*l1*l1;
M(2,1) = -m2*l1*l1;
M(2,2) = m2;

C(1,1) = m2*q2*dq2;
C(1,2) = m2*q2*dq1;
C(2,1) = -m2*q2*dq1;
C(2,2) = 0;

G(1,1) = 0.5*m1*g*l1*cos(q1) + m2*g*(l1*cos(q1)+q2*sin(q1));
G(2,1) = -m2*g*cos(q1);
end


