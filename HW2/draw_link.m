function draw_link = draw_link(pos_1,pos_2)
% draw the (n-1) link
plot([pos_1(1) pos_2(1)],[pos_1(2) pos_2(2)],'color','black','Linewidth',7,'Marker','o',...
                               'MarkerSize',5,...
                               'MarkerEdgeColor','b',...
                               'MarkerFaceColor',[0 0.4470 0.7410]);
xlim([-1 2]);
ylim([-1 2]);
grid on;
end

