%%%  plot the normalized transmission ratio r? against the normalized
%%%  acceleration a*

clear all;
clc;
close all;

k = 1;

r_norm = 0:0.01:5;

a_norm = a_cal(r_norm,1);
plot(r_norm,a_norm,'Linewidth',2);
xlabel('r_{norm}');
ylabel('a_{norm}');
grid on;



