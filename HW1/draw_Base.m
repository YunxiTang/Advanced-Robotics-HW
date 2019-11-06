function Base_Frame = draw_Base()
%   Draw base frame

% Base Frame {B}
plot3([0 .5],[0 0],[0 0],'Color','red','Linewidth',1.5);
plot3([0 0],[0 .5],[0 0],'Color','c','Linewidth',1.5);
plot3([0 0],[0 0],[0 .5],'Color','blue','Linewidth',1.5);

text(0,0.1,0,'{B}');
text(0.5,0,0,'X_B');
text(0,0.5,0,'Y_B');
text(0,0,0.5,'Z_B');

end

