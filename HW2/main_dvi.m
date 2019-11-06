clear all;clc;
%%%  simuation of the Jacobian-based inverse kinematics loop BY AVOIDING
%%%  JOINT LIMITS
% gains--K
K = [500 0;0 500];
i = 1;
dt = 0.001;
ts = 50;
I = [1 0 0;0 1 0;0 0 1];

% q_r --> record the joint degrees
% qd_r --> record the joint velocity
q_r = [];
qd_r = [];

% e_r --> record the endtip position error
e_r = [];

% x_r --> record the real joint positions
x1_r = [];
x2_r = [];
xtip_r = [];

% Xtip_r --> record the desired end positions
Xtip_r = [];


%% the initial state
% q = [pi;-pi/2;pi/2];
q = [pi;-pi/4;pi/2];

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
    J_pseu = Jacobian_pseu(J);
    
    % to check the  version without limit-avoid, please CHANGE 500 TO 0
    qd_r(:,i)=J_pseu*(xd_dsr+K*e)+(I-J_pseu*J)*Avoid_Limit_V2(500,q);  
    q = q + qd_r(:,i)*dt;
    
    e_r(i)= sqrt(e'*e);
    i=i+1;
end

% desired trajectory
t=0:dt:ts;
[x_dsr, xd_dsr] = traject_generate(t);

%% plot
% animation
figure(1);
% animation(x1_r,x2_r,xtip_r);
axis equal;

%  tracking error of the tip ||xerror|| 
figure(2);
plot(t,e_r,'linewidth',2);
xlabel('t');
ylabel('Distance/m');
title('||x||_e_r_r_o_r');
grid on;

%  the evolution of joint angles 
%  q1
figure(3);
plot(t,q_r(1,:),t,2*pi*ones(1,length(t)),'-.',t,0*ones(1,length(t)),'-.','linewidth',2);
title('\Theta_1');
legend('\Theta_1','Upper Boundary','Lower Boundary','Fontname','Times New Roman',...
    'Fontsize',12,'Orientation','horizontal');
grid on;

% q2
figure(4);
plot(t,q_r(2,:),t,pi*ones(1,length(t)),'-.',t,-pi*ones(1,length(t)),'-.','linewidth',2);
title('\Theta_2');
legend('\Theta_2','Upper Boundary','Lower Boundary','Fontname','Times New Roman',...
    'Fontsize',12,'Orientation','horizontal');
grid on;

% q3
figure(5);
plot(t,q_r(3,:),t,2*pi*ones(1,length(t)),'-.',t,0*pi*ones(1,length(t)),'-.','linewidth',2);
title('\Theta_3');
legend('\Theta_3','Upper Boundary','Lower Boundary','Fontname','Times New Roman',...
    'Fontsize',12,'Orientation','horizontal');
grid on;

% xlabel('t');
% ylabel('Angles/rad');
% title('Joint Angles');
% legend('q1','q2','q3');
% grid on;

% % joint velocities
% figure(4);
% plot(t,qd_r(1,:),t,qd_r(2,:),t,qd_r(3,:),'linewidth',2);
% ylim([-2 2]);
% xlabel('t');
% ylabel('Velocity/(rad/s)');
% title('Joint Velocity');
% legend('qd1','qd2','qd3');
% grid on;

