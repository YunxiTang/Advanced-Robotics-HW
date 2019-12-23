function [t,x] = desired_motion(t_span)
%DESIRED_MOTION Summary of this function goes here
%   Detailed explanation goes here
t = linspace(t_span(1),t_span(2),(t_span(2)-t_span(1))*100);

q1 = sin(2*pi*t);
q2 = -t.^2+5*t;

dq1 = 2*pi*cos(2*pi*t);
dq2 = -2*t+5;

ddq1 = -4*pi^2*sin(2*pi*t);
ddq2 = -2*ones(1,length(t));

x = [q1;q2;dq1;dq2;ddq1;ddq2];

end

