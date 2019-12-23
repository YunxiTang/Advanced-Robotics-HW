function [t,q1,q1d,q1dd,qs2] = Run_simulation(t_span,P,x0)
%RUN_SIMLATION Summary of this function goes here
%   t_span --> simulation time
%   P --> system parameters
%   x0 --> initial state
%   controller -- controller

%% control torque
% u = [0;0];

%% time interval
dt = 0.01;
t = linspace(t_span(1),t_span(2),(t_span(2)-t_span(1))/dt);

%% initial point: q1dd=?,q1d = 0,q1=0,q2dd=-2, q2d=5,q2=0
k=1;
q1(k) = 0;
q2(k) = 0;
q1d(k) = 0;
% q2dd(k) = -2;
q2d(k) = 5;
q1dd = [];
x(:,k) = [q1(k);q2(k);q1d(k);q2d(k)];
%% dynamics: to compute the acceleration in LOOP
for i=1:length(t)-1
    qs2(:,k) = q2_desired(t(k));
    [M,C,~] = motion_equation(x(:,k),P);
    % update q1dd
    m11 = M(1,1);
    m12 = M(1,2);
    c11 = C(1,1);
    c12 = C(1,2);
    % Acceleration
    q1dd(k) = -1/m11*(m12*qs2(3,k)+c11*q1d(k)+c12*qs2(2,k));
    % Velocity
    q1d(k+1) = q1d(k)+ q1dd(k)*dt;
    % Position
    q1(k+1) = q1(k) + q1d(k) * dt + 0.5*q1dd(k)*dt*dt;
    
    % update x
    k = k + 1;
    qs2(:,k) = q2_desired(t(k));
    x(:,k) = [q1(k);qs2(1,k);q1d(k);qs2(2,k)];
end
end

