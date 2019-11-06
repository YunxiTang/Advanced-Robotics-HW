function [x_dsr,xd_dsr] = traject_generate(t)
% Cartesian trajectory generation
% generate the desired trajectory
x_dsr = [0.3*(1-cos(pi*t));0.3*(1-sin(pi*t))];
xd_dsr = [0;0];
end

