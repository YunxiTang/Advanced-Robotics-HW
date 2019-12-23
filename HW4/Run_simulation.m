function [t,x] = Run_simulation(t_span,P,x0,control_torque)
%RUN_SIMLATION Summary of this function goes here
%   t_span --> simulation time
%   P --> system parameters
%   x0 --> initial state
%   controller -- controller

%% input torque u
u = [0;0];

%% ODE45 solver
options = odeset('RelTol',1e-8, 'AbsTol',1e-8);

sol = ode45(@(t,x)(dynamics(P,x,u)), t_span, x0, options);

t = linspace(t_span(1),t_span(2),(t_span(2)-t_span(1))*100);

x = deval(sol,t);
end

