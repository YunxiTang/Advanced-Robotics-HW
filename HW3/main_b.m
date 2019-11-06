%%% 1(b): using cubic polynomial to generate a trajectory from 5 degrees
%%% to 95 degrees in 1 sec and compare with 1(a)

clear all;
clc;close all;

% initial position
theta_i_a = 20;
theta_i_b = 5;

% final position
theta_f_a = 60;
theta_f_b = 95;
% time span
t_f_a = 3;
t_f_b = 1;

%% trajectory generation
[t_a,pos_a,vel_a,accel_a] = cubic_tragenerate(theta_i_a,theta_f_a,t_f_a);
[t_b,pos_b,vel_b,accel_b] = cubic_tragenerate(theta_i_b,theta_f_b,t_f_b);

%% plot
figure(1);
plot(t_a,pos_a,t_b,pos_b,'Linewidth',2);
legend('20-->60 IN 3 sec','5-->95 IN 1 sec');
grid on;
figure(2);
plot(t_a,vel_a,t_b,vel_b,'Linewidth',2);
legend('20-->60 IN 3 sec','5-->95 IN 1 sec');
grid on;
figure(3);
plot(t_a,accel_a,t_b,accel_b,'Linewidth',2);
legend('20-->60 IN 3 sec','5-->95 IN 1 sec');
grid on;