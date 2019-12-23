function [] = Run_animation(t,x,P)
% animation

%%Joint angle
q = x(1:2,:);
[~,n] = size(t);
k = 1;
%% forwark kinematics
figure(1)
for i=1:5:n
    clf;
    qs = q(:,k);
    [pos_s,pos_1,pos_2] = fk(qs,P);
    draw_link(pos_s,pos_1);
    hold on;
    draw_link(pos_1,pos_2);
    hold on;
    xlim('auto');
    ylim('auto');
    zlim('auto');
    grid on;
    pause(0.001);
    k = k+1;
%     Pos_s(:,k) = pos_s;
%     Pos_1(:,k) = pos_1;
%     Pos_2(:,k) = pos_2;  
end
%% movie








% [~,n] = size(X1);
% for i=1:20:n
%     
%     draw_link([0;0],X1(:,i));
%     hold on;
%     draw_link(X1(:,i),X2(:,i));
%     
%     axis equal;
%     pause(0.001);
% end

