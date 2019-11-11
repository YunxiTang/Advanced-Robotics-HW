%%% the step response of the system is critically damped (Without a disturbance input).
%%% use the built-in ODE45 function to do the numerical integration.

clear all;
clc;
[t,x] = ode45(@(t,x)dynamics(t,x,0),[0 20],[0;0]);
theta = x(:,1);
thetad = x(:,2);
plot(t,theta,t,thetad,'Linewidth',2);
xlabel('t / [s]','Fontname','Times New roman');
legend('\theta','\theta_d','Orientation','horizontal','Fontsize',12,...
       'Fontname', 'Times New Roman');
grid on;

