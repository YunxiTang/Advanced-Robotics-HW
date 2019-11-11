%%%  plot the normalized transmission ratio r* against the normalized
%%%  acceleration a* with different Mnew = kM

clear all;
clc;
close all;

h = 1;

r_norm = 0:0.01:5;

a_norm0 = a_cal(r_norm,1);
a_norm1 = a_cal(r_norm,1.25);
a_norm2 = a_cal(r_norm,1.5);
a_norm3 = a_cal(r_norm,1.75);
plot(r_norm,a_norm0,r_norm,a_norm1,r_norm,a_norm2,r_norm,a_norm3,'Linewidth',2);
legend('k = 1','k = 1.25','k = 1.5','k = 1.75','Orientation','horizontal',...
    'Fontname','Times New Roman','Fontsize',12);

xlabel('r_{norm}');
ylabel('a_{norm}');
grid on;