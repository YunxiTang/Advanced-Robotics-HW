function J = Jacobian(q)
% To compute the Jacobian matrix J by analytical way
q1 = q(1);
q2 = q(2);
q3 = q(3);

J = [-sin(q1)-sin(q1+q2)-sin(q1+q2+q3) -sin(q1+q2)-sin(q1+q2+q3) -sin(q1+q2+q3);
     cos(q1)+cos(q1+q2)+cos(q1+q2+q3) cos(q1+q2)+cos(q1+q2+q3) cos(q1+q2+q3)];
end

