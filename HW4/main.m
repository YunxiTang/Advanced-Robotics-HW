%%% Simulation 

clear all;
clc;
close all;
%% initial state (x-->[q1;q2;q1d;q2d])
x0 = [deg2rad(0); 0; deg2rad(0); 5]; 

%% simulation time
t_span = [0 10];

%% set the system parameters
P = set_Params();

%% run simulation
[t,q1,q1d,q1dd,qs2] = Run_simulation(t_span,P,x0);

%% plot
show_plot(t,q1,q1d,q1dd,qs2);
