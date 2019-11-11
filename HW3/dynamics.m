function [dx] = dynamics(t,x,t_dist)
% ode: 3edd+12ed+12e = t_dist
% x(1)=theta,x(2)=theta_d
theta_ref = 1;
dx = [0 1;-4 -4]*x+[0; 4]*theta_ref + [0;1/3]*t_dist;
end

