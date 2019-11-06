%%% 1(d): using linear polynomial with parabolic to generate a trajectory from 20 degrees
%%% to 60 degrees in 3 secs

clear all;
clc;close all;

% initial position
theta_i = 20;

% final position
theta_f = 60;

% time span
t_f = 3;

%% trajectory generation
[t,pos,vel,accel] = linear_tragenerate(theta_i,theta_f,t_f,18);

%% plot
figure(1);
plot(t,pos);
grid on;
figure(2);
plot(t,vel);
grid on;
figure(3);
plot(t,accel);
grid on;