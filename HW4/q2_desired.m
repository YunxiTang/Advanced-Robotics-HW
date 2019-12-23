function [x_2] = q2_desired(t)
%Q2_DESIRED Summary of this function goes here
%   Detailed explanation goes here
q2 = -t*t+5*t;
q2d = -2*t + 5;
q2dd = -2;
x_2 = [q2;q2d;q2dd];

% q2 = sin(t);
% q2d = cos(t);
% q2dd = -sin(t);
% x_2 = [q2;q2d;q2dd];
end

