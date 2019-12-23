function [] = show_plot(t,x)
%SHOW_PLOT Summary of this function goes here
%   input: t --> time
%          x --> state
figure(2);

subplot(4,1,1);
plot(t,x(1,:),'linewidth',2);
title('\theta_1','Fontname','Times New Roman',...
    'Fontsize',12);
ylabel('rad','Fontname','Times New Roman',...
    'Fontsize',10);
grid on;


subplot(4,1,2);
plot(t,x(2,:),'linewidth',2);
title('\theta_2','Fontname','Times New Roman',...
    'Fontsize',12);
ylabel('rad','Fontname','Times New Roman',...
    'Fontsize',12);
grid on;


subplot(4,1,3);
plot(t,x(3,:),'linewidth',2);
title('d\theta_{1}','Fontname','Times New Roman',...
    'Fontsize',12);
ylabel('rad/s','Fontname','Times New Roman',...
    'Fontsize',12);
grid on;

subplot(4,1,4);
plot(t,x(4,:),'linewidth',2);
title('d\theta_{2}','Fontname','Times New Roman',...
    'Fontsize',12);
xlabel('t / [s]','Fontname','Times New Roman',...
    'Fontsize',12)
ylabel('rad/s','Fontname','Times New Roman',...
    'Fontsize',12);
grid on;


end

