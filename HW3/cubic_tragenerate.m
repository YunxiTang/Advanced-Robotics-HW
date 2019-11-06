function [t,pos,vel,accel] = cubic_tragenerate(pos_i,pos_f,t_span)
% generate the cubic trajectory
%  params: initial pos, final pos, time span

theta_i = pos_i;
theta_f = pos_f;
t_f = t_span;
theta_i_d = 0;
theta_f_d = 0;

%% symbolic computing
syms x y z w

eqn1 = x == theta_i;
eqn2 = x + t_f*y + t_f*t_f*z + t_f*t_f*t_f*w == theta_f;
eqn3 = y == theta_i_d;
eqn4 = y + 2*t_f*z + 3*t_f*t_f*w == theta_f_d;

sol = solve([eqn1, eqn2, eqn3, eqn4], [x,y,z,w]);
a0 = sol.x;
a1 = sol.y;
a2 = sol.z;
a3 = sol.w;
fprintf('the coefficients from %d to %d in %d sec(s):',theta_i,theta_f);
fprintf('a0 = %.3f, a1 = %.3f, a2 = %.3f, a3 = %.3f\n',a0,a1,a2,a3);


%% pos vel accel
dt = 0.01;
t = 0:dt:t_f;

pos = a0 + a1*t + a2*t.*t + a3*t.*t.*t;
vel = a1 + 2*a2*t + 3*a3*t.*t;
accel = 2*a2 + 6*a3*t;







end

