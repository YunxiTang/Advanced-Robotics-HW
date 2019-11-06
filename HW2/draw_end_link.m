function draw_end_link = draw_end_link(pos_1,pos_2)
% draw the link
plot([pos_1(1) pos_2(1)],[pos_1(2) pos_2(2)],'color','black','Linewidth',6);
xlim([-1 2]);
ylim([-1 2]);
grid on;
end


