function [u] = PD_Control(t,P,x)
%PD_CONTROL Summary of this function goes here
%   PD controller
%   Input: x = [q1;q2;q1d;q2d]
%          P: System parameters

%% obtain the current state of joints
q1 = x(1);
q2 = x(2);
q1d = x(3);
q2d = x(4);

%% gains
Kp = [1200 0;
      0 1200];

Kd = [900 0;
      0 700];
%% gravity term
[~,~,G] = motion_equation(t,x,P);

%% controller design
u = [0;0] + G; 

end

