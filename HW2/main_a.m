clear all;clc;
%%%  simuation of the Jacobian-based inverse kinematics loop 
% gains--K
K = 0.5*[500 0;0 500];
i = 1;
dt = 0.001;
ts = 5;

% q_r --> record the joint degrees
% qd_r --> record the joint velocity
q_r = [];
qd_r = [];
W = [];

% e_r --> record the endtip position error
e_r = [];

% x_r --> record the real joint positions
x1_r = [];
x2_r = [];
xtip_r = [];

% Xtip_r --> record the desired end positions
Xtip_r = [];


%% the initial state
q = [0;-pi/2;pi/2];

%% for loop
for t=0:dt:ts
    % generate the desired trajectory 
    [x_dsr, xd_dsr] = traject_generate(t);
    
    % current state
    q_r(:,i) = q;
    [x1_r(:,i),x2_r(:,i),xtip_r(:,i)] = fk(q);
    
    % control law
    e = x_dsr - xtip_r(:,i);
    J = Jacobian(q);
    
    % manupilablity
    W(i) = sqrt(det(J*J'));
    
    J_pseu = Jacobian_pseu(J);

    qd_r(:,i)=J_pseu*(xd_dsr+K*e); 
    q = q + qd_r(:,i)*dt;
    
    % ||error||
    e_r(i)= sqrt(e'*e);
    i=i+1;
end

% desired trajectory
t=0:dt:ts;
[x_dsr, xd_dsr] = traject_generate(t);

%% plot
% animation
figure(1);
animation(x1_r,x2_r,xtip_r);
axis equal;

%  tracking error of the tip ||xerror|| 
figure(2);
plot(t,e_r,'linewidth',2);
xlabel('t');
ylabel('Distance/m');
title('||x||_e_r_r_o_r');
grid on;

%  the evolution of joint angles 
figure(3);
plot(t,q_r(1,:),t,q_r(2,:),t,q_r(3,:),'linewidth',2);
xlabel('t');
ylabel('Angles/rad');
title('Joint Angles');
legend('q_1','q_2','q_3','Fontname','Times New Roman',...
    'Fontsize',12,'Orientation','horizontal');
grid on;

% joint velocities
figure(4);
plot(t,qd_r(1,:),t,qd_r(2,:),t,qd_r(3,:),'linewidth',2);
ylim([-2 2]);
xlabel('t');
ylabel('Velocity/(rad/s)');
title('Joint Velocity');
legend('qd_1','qd_2','qd_3','Fontname','Times New Roman',...
    'Fontsize',12,'Orientation','horizontal');
grid on;

% Manipulability
figure(5);
plot(t,W,'linewidth',2);
grid on;
xlabel('t/s');
title('Manipulability');
grid on;
