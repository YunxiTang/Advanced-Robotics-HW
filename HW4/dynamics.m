function [xd] = dynamics(P,x,u)
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

[M,C,G] = motion_equation(x,P);
qdd = M \ (u - G - C*[q1d;q2d]);
xd = [q1d;q2d;qdd(1);qdd(2)];

end

