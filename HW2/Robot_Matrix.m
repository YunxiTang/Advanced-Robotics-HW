function T = Robot_Matrix(qc)
% The transformation matrix of the whole robot, which is 0Ttip

% The DH table of the manipulator
% +---+-----------+-----------+-----------+-----------+-----------+
% |  i|     theta |         d |         a |     alpha |    offset |
% +---+-----------+-----------+-----------+-----------+-----------+
% |  1|          0|         q1|          0|          0|        2*L|
% |  2|         q2|          0|          0|       pi/2|          0|
% |  3|         q3|          0|          L|      -pi/2|          0|
% |  4|         q4|          0|          0|       pi/2|       pi/2|
% |  5|         q5|  sqrt(2)*L|          0|       pi/4|          0|
% |  6|       pi/2|         q6|          0|       pi/4|          L|
% |Tip|          0|          0|          0|       pi/2|          0|
% +---+-----------+-----------+-----------+-----------+-----------+

% The length of link L is a constant, set its value here
L = 0.5;

% define the joint variables q = [q1; q2; q3; q4; q5; q6; q7].
% q is a column vector

% q0 is the initial configuration of the manipulator showed in Figure 1
q0 = [2*L;0;0;pi/2;0;L;0];

% qc is the joint angle degree command 
%(Based on the manipulator configuration in Figure. 1)
% As there is no actual joint in the end effctor, 
% so keep qc(7) as 0 all the time
q = q0 + [qc; 0];

% create the transformation matrix for each link
T01 = TransMatrix(0,q(1),0,0);
T12 = TransMatrix(q(2),0,0,pi/2);
T23 = TransMatrix(q(3),0,L,-pi/2);
T34 = TransMatrix(q(4),0,0,pi/2);
T45 = TransMatrix(q(5),sqrt(2)*L,0,pi/4);
T56 = TransMatrix(pi/2,q(6),0,pi/4);
T6tip = TransMatrix(0,0,0,pi/2);

% the whole transformation matrix 
T = T01*T12*T23*T34*T45*T56*T6tip;
end

