function [X1,X2,Xtip] = fk(q)
% foward kinematics of 3R robot
q1 = q(1);
q2 = q(2);
q3 = q(3);

x1 = cos(q1);
y1 = sin(q1);
X1 = [x1;y1];

x2 = cos(q1)+cos(q1+q2);
y2 = sin(q1)+sin(q1+q2);
X2 = [x2;y2];

xtip = cos(q1)+cos(q1+q2)+cos(q1+q2+q3);
ytip = sin(q1)+sin(q1+q2)+sin(q1+q2+q3);
Xtip = [xtip;ytip];

end

