function [q1dd] = dynamicsx(t,P,x,u)
%DYNAMICSX Summary of this function goes here
%   Detailed explanation goes here
%DYNAMICS ode
%   t: simulation time
%   P: system parameters
%   x: current state x=[q1;q2;q1d;q2d]
%   u: control torque
%   xd: xd = [q1d;q2d;q1dd;q2dd]
q1 = x(1);
q2 = x(2);
q1d = x(3);
q2d = x(4);
qs2 = q2_desired(t);
[M,C,~] = motion_equation(x,P);

m11 = M(1,1);
m12 = M(1,2);
c11 = C(1,1);
c12 = C(1,2);
q1dd = -1/m11*(m12*qs2(3)+c11*q1d+c12*qs2(2));
end

