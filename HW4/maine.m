%% tau'*tau = 1
clc;
clear all;

k = linspace(0,2*pi,200);
tau = [cos(k);
       sin(k)];

q1 = pi/2;
q2 = pi/2;
q1d = 0;
q2d = 0;

x = [q1;q2;0;0];
P = set_Params(1, 1, 2, 2,10, 2);
L1 = P.L1;
L2 = P.L2;

[M,~,G] = motion_equation(x,P);

J_v2 = [-L1*sin(q1)-L2*cos(q1)*sin(q2) -L2*sin(q1)*cos(q2);
        L1*cos(q1)-L2*sin(q1)*sin(q2)   L2*cos(q1)*cos(q2);
        0                               L2*sin(q2)];
J = J_v2;
bias = J*pinv(M)*G;
Js = pinv(J);
Q = Js'*(M'*M)*Js;

[V,D] = eig(Q);

R = sqrt(D)*V';

w = 500;
[X,Y,Z] = sphere(w);
k = 1;
m = 1;
for i = 1:w
    n = 1;
    for j=1:w
        x(k) = X(m,n);
        y(k) = Y(m,n);
        z(k) = Z(m,n);
        temp = R' * [x(k);y(k);z(k)];
        x(k) = temp(1);
        y(k) = temp(2);
        z(k) = temp(3)-5;
        k = k + 1;
        n = n + 1;
    end
    m = m+1;
end

figure(1);
subplot(1,2,1);
plot(tau(1,:),tau(2,:),'linewidth',2);
xlabel('\tau_1');
ylabel('\tau_2');
xlim([-1,1]);
ylim([-1,1]);
axis equal;
grid on;
subplot(1,2,2);
plot3(x,y,z,'linewidth',2);
axis equal;
xlabel('x_s');
ylabel('y_s');
zlabel('z_s');
grid on;


