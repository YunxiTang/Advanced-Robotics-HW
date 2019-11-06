%%% 1(c): using linear polynomial with parabolic bends to generate a trajectory from 20 degrees
%%% to 60 degrees in 3 secs with acceleration 40 deg/s2 and 100 deg/s2

clear all;
clc;close all;

%% conditions
theta_i = 20;
theta_f= 60;
a_b1= 40;
a_b2=100;
t_f = 3;

%% trajectory generation
[t,pos1,vel1,accel1] = linear_tragenerate(theta_i,theta_f,t_f,a_b1);
[~,pos2,vel2,accel2] = linear_tragenerate(theta_i,theta_f,t_f,a_b2);

%% plot
figure(1);
plot(t,pos1,t,pos2);
grid on;
figure(2);
plot(t,vel1,t,vel2);
grid on;
figure(3);
plot(t,accel1,t,accel2);
grid on;