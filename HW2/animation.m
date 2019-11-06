function [] = animation(X1,X2,Xtip)
% 3R robot animation
% animation
[~,n] = size(X1);
for i=1:20:n
    clf;
    rectangle('Position',[-0.07,-0.07,0.14,0.14],'Curvature',0.08,...
        'FaceColor',[0.3010 0.7450 0.9330],'LineWidth',1);
    hold on;
    plot(Xtip(1,1:i),Xtip(2,1:i),'-.','linewidth',2);
    hold on;
    draw_link([0;0],X1(:,i));
    hold on;
    draw_end_link(X2(:,i),Xtip(:,i));
    hold on;
    draw_link(X1(:,i),X2(:,i));
    
    axis equal;
    pause(0.001);
end

