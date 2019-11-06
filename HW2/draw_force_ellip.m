function draw_force_ellip = draw_force_ellip(Point,J)
% draw force manipulability of end-effector
X=[];
[U,S,V] = svd(J');
t=0:0.1:4*pi;
x = cos(t);
y = sin(t);
X = 0.3*((V*(S'*inv(S*S'))*U')*[x;y])+[Point(1);Point(2)];

plot(X(1,:),X(2,:),'color','black','Linewidth',2);
axis equal;
end
