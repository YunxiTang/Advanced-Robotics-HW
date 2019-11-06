function qd_null = Avoid_Limit_V2(k0,q)
% To compute the qdot which avoid joint limits with the cost function
% mentioned in my appendix in Homework2
% q1:[0,2*pi]  q2:[-pi,pi]  q3:[0,2*pi]
q1 = q(1);
q2 = q(2);
q3 = q(3);
qd_null =-k0*[2778046668940015/(140737488355328*q1*(q1 - 2*pi)^2) + 2778046668940015/(140737488355328*q1^2*(q1 - 2*pi));
              2778046668940015/(281474976710656*(q2 + pi)*(q2 - pi)^2) + 2778046668940015/(281474976710656*(q2 + pi)^2*(q2 - pi));
              2778046668940015/(140737488355328*q3*(q3 - 2*pi)^2) + 2778046668940015/(140737488355328*q3^2*(q3 - 2*pi))];

end