function draw_Frame = draw_Frame(Point,T)
%   Draw joint frame
% Joint Frame 
X = 0.5*T(1:3,1);
Y = 0.5*T(1:3,2);
Z = 0.5*T(1:3,3);
plot3([Point(1) Point(1)+X(1)],[Point(2) Point(2)+X(2)],...
    [Point(3) Point(3)+X(3)],'Color','black','Linewidth',1.5);
plot3([Point(1) Point(1)+Y(1)],[Point(2) Point(2)+Y(2)],...
    [Point(3) Point(3)+Y(3)],'Color','c','Linewidth',1.5);
plot3([Point(1)-Z(1) Point(1)+Z(1)],[Point(2)-Z(2) Point(2)+Z(2)],...
    [Point(3)-Z(3) Point(3)+Z(3)],'Color','red','Linewidth',1.5);
text(Point(1)+Z(1),Point(2)+Z(2),Point(3)+Z(3),'Z');
end



