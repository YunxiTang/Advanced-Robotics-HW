%%% Simulation for the passive Furuta pendulum
% initially theta2 = 90 degs and theta1 = 0 deg and all the torques are set to zero
% simulation time: 6s
% ODE45 Method

clear all;
clc;
close all;
%% initial state
x0 = [deg2rad(0); deg2rad(90); deg2rad(0); deg2rad(0)]; 

%% simulation time
t_span = [0 300];

%% set the system parameters
P = set_Params(1, 1, 2, 2,10, 2);
% P = set_Params(1, 1, 1, 1,10, 4);
%% choose a controller
controller = 'Passive_Control';
% controller = 'PD_Control';

%% run simulation
[t,x] = Run_simulation(t_span,P,x0,controller);

%% animation
% Run_animation(t,x,P);

%% plot
show_plot(t,x);