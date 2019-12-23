 function [M,C,G] = EoM(t,x,model)
%EOM Summary of this function goes here
%   Detailed explanation goes here
l1 = model.l1;
m1 = model.m1;
m2 = model.m2;
I1 = model.I1;
g = model.g;

ddq1 = x(5,:);
ddq2 = x(6,:);

dq1 = x(3,:);
dq2 = x(4,:);

q1 = x(1,:);
q2 = x(2,:);

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

