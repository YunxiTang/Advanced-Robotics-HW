clear all;
clc;

q1 = sym('q1');
q2 = sym('q2');
q3 = sym('q3');

J =[ -sin(q1 + q2 + q3) - sin(q1 + q2) - sin(q1),  -sin(q1 + q2 + q3) - sin(q1 + q2),  -sin(q1 + q2 + q3);
      cos(q1 + q2 + q3) + cos(q1 + q2) + cos(q1),   cos(q1 + q2 + q3) + cos(q1 + q2),  cos(q1 + q2 + q3)];
   
JT = [-sin(q1 + q2 + q3) - sin(q1 + q2) - sin(q1), cos(q1 + q2 + q3)+cos(q1 + q2)+cos(q1);
      -sin(q1 + q2 + q3) - sin(q1 + q2),           cos(q1 + q2 + q3) + cos(q1 + q2);
      -sin(q1 + q2 + q3),                          cos(q1 + q2 + q3)];
  
H = J*JT;  
W = -sqrt(det(H));
qdot_null(1)=diff(W,q1);
qdot_null(2)=diff(W,q2);
qdot_null(3)=diff(W,q3);