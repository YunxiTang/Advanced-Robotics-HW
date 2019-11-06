% This is for the Q1 (a) (iii). To finish the forward kinematic of the manipulator
clear all;
close all;
clc;

%%
i = 1;

% position of the trajectory
P = [];

% q command
qc = ones(6,1);
Frame_tipx = zeros(3);
Frame_tipy = zeros(3);
Frame_tipz = zeros(3);

for t=0:0.02:5
    % joint degree command qc
    % Please note that all the zero points are the initial configuration
    % shown in Figure 1 on the question sheet
    qc = qc_generate(t);
    
    % the whole transformation matrix of manipylator
    T = Robot_Matrix(qc);
 
    % rotation matrix
    R = T(1:3,1:3);
    % the orientation of the tip frame
    Frame_tipx(:,i) = R*[0.5;0;0];
    Frame_tipy(:,i) = R*[0;0.5;0];
    Frame_tipz(:,i) = R*[0;0;0.5];
    
    % record tip position and qc
    P(:,i) = T(1:3,4);
    Q(:,i) = qc;
    i=i+1;
end
t = 0:0.02:5;

%%  Cartesian tip plot x_tip, y_tip, z_tip
figure(1)
plot(t,P(1,:),'-*',t,P(2,:),'-o',t,P(3,:),'-x');
xlabel('Time/s');
ylabel('Position/m');
grid on;
legend('x_t_i_p','y_t_i_p','z_t_i_p');
title(' Cartesian Tip ');

%% Joint plot
figure(2);
plot(t,Q(1,:),'-*',t,Q(2,:),'-o',t,Q(3,:),'-.',...
t,Q(4,:),'-+',t,Q(5,:),'-x',t,Q(6,:));
grid on;
xlabel('Time/s');
ylabel('Angle/rad');
legend('qc_J_1','qc_J_2','qc_J_3','qc_J_4','qc_J_5','qc_J_6');
title('Joint plot');

%% draw the orientation on the Cartesian trajectory
figure(3);
for j=1:1:length(t)
    clf(figure(3));
    plot3(P(1,:),P(2,:),P(3,:),'-.','Color','k');
    hold on;
    plot3(P(1,j),P(2,j),P(3,j),'Marker','o',...
                               'MarkerSize',5,...
                               'MarkerEdgeColor','b',...
                               'MarkerFaceColor',[0.1,0.1,0.1]);
    plot3([P(1,j) P(1,j)+Frame_tipx(1,j)],[P(2,j) P(2,j)+Frame_tipx(2,j)],...
    [P(3,j) P(3,j)+Frame_tipx(3,j)],'Color','red','Linewidth',1.5);

    plot3([P(1,j) P(1,j)+Frame_tipy(1,j)],[P(2,j) P(2,j)+Frame_tipy(2,j)],...
    [P(3,j) P(3,j)+Frame_tipy(3,j)],'Color','c','Linewidth',1.5);

    plot3([P(1,j) P(1,j)+Frame_tipz(1,j)],[P(2,j) P(2,j)+Frame_tipz(2,j)],...
    [P(3,j) P(3,j)+Frame_tipz(3,j)],'Color','blue','Linewidth',1.5);
    xlim([-1 3]);
    ylim([-1 3]);
    zlim([-1 3]);
    draw_Base();
    grid on;
    pause(0.001);
end

axis equal;
xlabel('x');
ylabel('y');
zlabel('z');
title('Cartesian Orientation');
grid on;



