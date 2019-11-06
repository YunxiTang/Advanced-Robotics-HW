clear all;
clc;
%% 2D foward kinematics
q = [-pi/2  -pi/4  0    pi/4  pi/2;
     -pi/4  -pi/6  pi/4  pi/3   pi/2];

% all the endtips are on the X axis: q2 = -2*q2
% q = [80/180*pi   70/180*pi   60/180*pi  50/180*pi  30/180*pi;
%      -160/180*pi -140/180*pi -120/180*pi -100/180*pi -60/180*pi];
for j=1:1:5
    q1 = q(1,j);
    q2 = q(2,j);

    x1 = cos(q1);
    y1 = sin(q1);
    X1 = [x1;y1];

    x2 = cos(q1)+cos(q1+q2);
    y2 = sin(q1)+sin(q1+q2);
    X2 = [x2;y2];

    %% Jacobian 
    J = [-sin(q1)-sin(q1+q2) -sin(q1+q2);
         cos(q1)+cos(q1+q2) cos(q1+q2)];
 
    %% plot
    plot([0 x1],[0 y1],'color','black','Linewidth',5,'Marker','o',...
                   'MarkerSize',5,...
                   'MarkerEdgeColor','b',...
                   'MarkerFaceColor',[0.1,0.1,0.1]);
    hold on;
    plot([x1 x2],[y1 y2],'color','blue','Linewidth',5,'Marker','o',...
                    'MarkerSize',5,...
                    'MarkerEdgeColor','b',...
                    'MarkerFaceColor',[0.1,0.1,0.1]);
                
    draw_vel_ellip(X2,J);
    draw_force_ellip(X2,J);
    axis equal;
    legend('Link 2','Link 3','Velocity Ellipsoid','Force Ellipsoid','Fontname','Times New Roman');
    xlabel('X/m');
    ylabel('Z/m');
    grid on;
    hold on;
    
    pause(0.1);
end