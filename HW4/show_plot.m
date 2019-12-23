function [] = show_plot(t,q1,q1d,q1dd,qs2)
%SHOW_PLOT Summary of this function goes here
%   input: t --> time
%          x --> state

figure(1);
subplot(3,1,1);
plot(t,q1,'linewidth',2);
ylabel('rad','Fontname','Times New Roman',...
    'Fontsize',12);
title('\theta_1','Fontname','Times New Roman',...
    'Fontsize',12);
grid on;
subplot(3,1,2);
plot(t,q1d,'linewidth',2);
ylabel('rad/s','Fontname','Times New Roman',...
    'Fontsize',12);
title('d\theta_1','Fontname','Times New Roman',...
    'Fontsize',12);
grid on;
subplot(3,1,3);
plot(t(1:length(q1dd)),q1dd,'linewidth',2);
ylabel('rad/s^2','Fontname','Times New Roman',...
    'Fontsize',12);
title('dd\theta_1','Fontname','Times New Roman',...
    'Fontsize',12);
grid on;

figure(2);
subplot(3,1,1);
plot(t(1:length(qs2)),qs2(1,:),'linewidth',2);
ylabel('m','Fontname','Times New Roman',...
    'Fontsize',12);
title('d_{2}','Fontname','Times New Roman',...
    'Fontsize',12);
grid on;
subplot(3,1,2);
plot(t(1:length(qs2)),qs2(2,:),'linewidth',2);
ylabel('m/s','Fontname','Times New Roman',...
    'Fontsize',12);
title('d^{''}_{2}','Fontname','Times New Roman',...
    'Fontsize',12);
grid on;
subplot(3,1,3);
plot(t(1:length(qs2)),qs2(3,:),'linewidth',2);
ylabel('m/s^2','Fontname','Times New Roman',...
    'Fontsize',12);
title('d^{''''}_{2}','Fontname','Times New Roman',...
    'Fontsize',12);
grid on;
end

