function [t,q1dd] = Run_simulationx(t_span,P,x0)
%RUN_SIMLATION Summary of this function goes here
%   t_span --> simulation time
%   P --> system parameters
%   x0 --> initial state
%   controller -- controller


%% ODE45 solver
options = odeset('RelTol',1e-8, 'AbsTol',1e-8);

sol = ode45(@(t,x)(dynamics(t,P,x,u)), t_span, x0, options);

t = linspace(t_span(1),t_span(2),(t_span(2)-t_span(1))*100);

q1dd = deval(sol,t);

%% initial point: q1dd=?,q1d = 0,q1=0,q2dd=-2, q2d=5,q2=0
k=1;
q1(k) = 0;
q2(k) = 0;
q1d(k) = 0;
% q2dd(k) = -2;
q2d(k) = 5;
q1dd = [];
x(:,k) = [q1(k);q2(k);q1d(k);q2d(k)];