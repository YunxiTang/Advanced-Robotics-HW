function T = Trans(flag,d)
% generate the transformation matrix for translating operation

% T is made of four parts [R | P; EX | 1]
% for translating R is always eye(3)
% and EX = [0 0 0]
R = eye(3);
EX = [0 0 0];

if flag == 'X'
    P = [d;0;0];
end

if flag == 'Y'
   P = [0;d;0];
end

if flag == 'Z'
   P = [0;0;d];
end

T = [R P;
     EX 1];

end

