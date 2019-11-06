% This is to verify the workspace of RRP robot in Q3
L1 = 1.0;
L3 = 1.0;
i = 1;
x = [];
y = [];
z = [];
% q1 = -2*pi:0.01:2*pi;
% q2 = -2*pi:0.01:2*pi;
% q3 = 0:0.01:100;
for q1= -2*pi:0.1:2*pi
    for q2 = -2*pi:0.1:2*pi
        for q3 = 0:0.1:20
            phi = q1 - q2;
            x(i) = L1*cos(q1)+(L3+q3)*cos(phi);
            y(i) = L1*sin(q1)+(L3+q3)*sin(phi);
            z(i) = phi;
            i=i+1;
        end
    end
end

figure(1);
scatter3(x,y,z);
xlabel('x');
ylabel('y');
zlabel('\phi');
axis equal;
% 
% figure(2);
% plot(1:i-1,z);