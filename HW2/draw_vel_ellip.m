function draw_vel_ellip = draw_vel_ellip(Point,J)
% draw velocity manipulability of end-effector
X=[];
t=0:0.1:4*pi;
x = cos(t);
y = sin(t);
X = 0.3*(J*[x;y])+[Point(1);Point(2)];

plot(X(1,:),X(2,:),'color','red','Linewidth',2);
axis equal;
end
