function [t,pos,vel,accel] = linear_tragenerate(pos_i,pos_f,t_span,ab)
% generate the linear with parabolic bends trajectory
%  params: initial pos, final pos, time span, acceleration_b

theta_i = pos_i;
theta_f = pos_f;
a_b = ab;
t_f = t_span;

t_b = t_f/2 - sqrt((t_f*t_f*a_b-4*(theta_f-theta_i))/a_b)/2;
fprintf('tb with ab = %.3f is %.3f\n',a_b,t_b);

%% first parabolic region
dt = 0.001;
t1 = 0:dt:t_b;
pos1 = theta_i + 0.5*a_b*t1.*t1;
vel1 = a_b*t1;
accel1 = a_b*(t1./t1);

%% linear region
t2_o = t1(end);
t2 = t2_o:dt:(t_f-t_b);
pos2 = pos1(end)+vel1(end)*(t2-t2_o);
vel2 = vel1(end)*t2./t2;
accel2 = 0*t2;

%% second parabolic region
t3_o = t2(end);
t3 = t3_o:dt:t_f-dt;
pos3 = pos2(end)+(vel2(end)*(t3-t3_o)-0.5*a_b*(t3-t3_o).*(t3-t3_o));
vel3 = vel2(end) - a_b*(t3-t3_o);
accel3 = -a_b*(t3./t3);

%% return 
t = [t1 t2 t3];
pos = [pos1 pos2 pos3];
vel = [vel1 vel2 vel3];
accel = [accel1 accel2 accel3];


end

