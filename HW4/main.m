%%% compute the required torque for desired motion
clear all;
clc;
close all;

%% simulation time
t_span = [0 5];

%% desired motion
[t,x] = desired_motion(t_span);

%% dynamics
i = 1;
tau = [];
for n = 1:length(t)
    xc = x(:,i);
    [M,C,G] = EoM(t,xc,model);
    tau(:,i) = M*x(5:6,i)+C*x(3:4,i)+G;
    i = i+1;
end

figure(1);
subplot(2,1,1);
plot(t,x(1,:),'linewidth',2);
title('\theta_1','Fontname','Times New Roman',...
    'Fontsize',12);
xlabel('t / [s]');
grid on;
subplot(2,1,2);
plot(t,x(2,:),'linewidth',2);
grid on;
title('d_2');
xlabel('t / [s]');

figure(2);
subplot(2,1,1);
plot(t,tau(1,:),'linewidth',2);
title('\tau_1 (without gravity)','Fontname','Times New Roman',...
    'Fontsize',12);
grid on;
xlabel('t / [s]');
subplot(2,1,2);
plot(t,tau(2,:),'linewidth',2);
title('\tau_2 (without gravity)','Fontname','Times New Roman',...
    'Fontsize',12);
xlabel('t / [s]');
grid on;