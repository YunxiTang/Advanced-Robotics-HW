%%% the step response of the system is critically damped ( inject a “step” disturbance 0.12Nm into the closed-loop system ).
%%% use the built-in ODE45 function to do the numerical integration. The
%%% initial state of theta is [0;0]

clear all;
clc;close all;

% disturbance tortque
t_dist = 0.12;

% solve ode
[t,x] = ode45(@(t,x)dynamics(t,x,t_dist),[0 20],[0;0]);

theta = x(:,1);
thetad = x(:,2);
plot(t,theta,t,thetad,'Linewidth',2);
hold on;

% steady state
plot(t,theta(end)*t./t,'-.','Linewidth',2);

xlabel('t / [s]','Fontname','Times New roman','Fontsize',12);
legend('\theta','\theta_d','Steady Error','Orientation','horizontal','Fontsize',12,...
       'Fontname', 'Times New Roman');
grid on;
hold off;