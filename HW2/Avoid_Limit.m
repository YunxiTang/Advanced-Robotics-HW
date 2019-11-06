function qd_null = Avoid_Limit(k0,q)
% To compute the qdot which avoid joint limits with cost function mentioned
% in the lecture notes
% q1:[0,2*pi]  q2:[-pi,pi]  q3:[0,2*pi]

q1 = q(1);
q2 = q(2);
q3 = q(3);

qd_null =-1/3*k0*[2*(q1-pi)/(2*pi);
                 2*(q2)/(2*pi);
                 2*(q3-pi)/(2*pi)];

end

