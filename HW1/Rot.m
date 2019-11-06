function T = Rot(flag,theta)
% generate transformatiom matrix for rotating operation

if flag == 'X'
    T = [1 0          0           0;
         0 cos(theta) -sin(theta) 0;
         0 sin(theta) cos(theta)  0;
         0 0          0           1];
end

if flag == 'Y'
    T = [cos(theta)  0  sin(theta) 0;
         0           1  0          0;
         -sin(theta) 0  cos(theta) 0;
         0           0  0          1];
end

if flag == 'Z'
    T = [cos(theta) -sin(theta) 0 0;
         sin(theta) cos(theta)  0 0;
         0          0           1 0;
         0          0           0 1];
end
    
end

