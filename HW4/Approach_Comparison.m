%%% Compare Simulation Results between ODE45 and EULER for the passive Furuta pendulum
% initially theta2 = 90 degs and theta1 = 0 deg and all the torques are set to zero
% simulation time: 6s

clear all;
clc;
close all;
%% initial state
x0 = [deg2rad(0); deg2rad(90); deg2rad(0); deg2rad(0)]; 

%% simulation time
t_span = [0 6];

%% set the system parameters
P = set_Params(1, 1, 2, 2,10, 2);
% P = set_Params(1, 1, 1, 1,10, 4);
%% choose a controller
controller = 'Passive_Control';
% controller = 'PD_Control';

%% run simulation
% ODE 45
[t_ode,x_ode] = Run_simulation(t_span,P,x0,controller);
% EULER
[t_euler,x_euler] = Run_EulerInt(t_span,P,x0,controller);

%% plot
figure(1);
subplot(2,1,1);
plot(t_ode,x_ode(1,:),t_euler,x_euler(1,:),...
     t_ode,x_ode(2,:),t_euler,x_euler(2,:),'linewidth',2);
legend('\theta_{1}^{ode}','\theta_{1}^{euler}',...
       '\theta_{2}^{ode}','\theta_{2}^{euler}',...
       'Fontname','Times New Roman','Fontsize',12,...
       'Orientation','horizontal');
grid on;
title('Angle','Fontname','Times New Roman',...
    'Fontsize',12);
xlabel('t / [s]');
ylabel('rad');

subplot(2,1,2);
plot(t_ode,x_ode(3,:),t_euler,x_euler(3,:),...
     t_ode,x_ode(4,:),t_euler,x_euler(4,:),'linewidth',2);
legend('d\theta_{1}^{ode}','d\theta_{1}^{euler}',...
       'd\theta_{2}^{ode}','d\theta_{2}^{euler}',...
       'Fontname','Times New Roman','Fontsize',12,...
       'Orientation','horizontal');
grid on;
title('Anglular velocity','Fontname','Times New Roman',...
    'Fontsize',12);
xlabel('t / [s]');
ylabel('rad/s');

figure(3);
subplot(2,1,1);
plot(t_ode,x_ode(1,:)-x_euler(1,:),t_ode,x_ode(2,:)-x_euler(2,:),'linewidth',2);
legend('\theta_{1error}^{ode-euler}','\theta_{2error}^{ode-euler}','Fontname','Times New Roman',...
    'Fontsize',12,'Orientation','horizontal');
grid on;
title('Angle Error','Fontname','Times New Roman',...
    'Fontsize',12);
xlabel('t / [s]');
ylabel('rad')

subplot(2,1,2);
plot(t_ode,x_ode(3,:)-x_euler(3,:),t_ode,x_ode(4,:)-x_euler(4,:),'linewidth',2);
legend('d\theta_{1error}^{ode-euler}','d\theta_{2error}^{ode-euler}','Fontname','Times New Roman',...
    'Fontsize',12,'Orientation','horizontal');
grid on;
title('Angular Velocity Error','Fontname','Times New Roman',...
    'Fontsize',12);
xlabel('t / [s]');
ylabel('rad/s')