function [t,x] = Run_EulerInt(t_span,P,x0,control_torque)
%EULER_INT Summary of this function goes here
%   Detailed explanation goes here

%% control torque
u = [0;0];

%% time interval
dt = 0.01;
t = linspace(t_span(1),t_span(2),(t_span(2)-t_span(1))/dt);
k = 1;
x(:,k) = x0;
%% dynamics: to compute the acceleration in LOOP
for i=1:length(t)-1 
    xd = dynamics(P,x(:,k),u);
    % Acceleration
    qdd = xd(3:4);
    % Velocity
    qd = x(3:4,k) + qdd * dt;
    % Position
    q = x(1:2,k) + qd * dt;
    
    % update x
    k = k + 1;
    x(:,k) = [q;qd];
end

end

