function [pos_s, pos_1, pos_2] = fk(q,P)
%forward kinematics
%   pos_s = base
%   pos_1 = [x1;y1;z1]
%   pos_2 = [x2;y2;z2]
%   q = [q1;q2]
%   P = the structure of the robot
q1 = q(1);
q2 = q(2);

pos_s = [0;
         0;
         0];
  
pos_1 = [P.L1*cos(q1);
         P.L2*sin(q1);
         0];
  
pos_2 = pos_1 + [-P.L2*sin(q2)*sin(q1);
                 P.L2*sin(q2)*cos(q1);
                 -P.L2*cos(q2)];
end

