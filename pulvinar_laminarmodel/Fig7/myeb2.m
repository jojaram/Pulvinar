function myeb2(x,ymean,ysigma,color)
%color has to be on the format: color=[R G B]

% %with transparencies:
% revx=fliplr(x);
% yminus=ymean-ysigma;
% yplus=fliplr(ymean+ysigma);
% fillerror=fill([x revx],[yminus yplus],color,'FaceAlpha',0.2);hold on;
% set(fillerror,'EdgeColor','None');
% plot(x,ymean,'Color',color,'LineWidth',3);
% % set(gca,'FontSize',18,'LineWidth',3)
% hold off;


%without transparencies:
revx=fliplr(x);
yminus=ymean-ysigma;
yplus=fliplr(ymean+ysigma);
fillerror=fill([x revx],[yminus yplus],0.25*color+[0.75 0.75 0.75]);
hold on;set(fillerror,'EdgeColor','None');
plot(x,ymean,'Color',color,'LineWidth',3);
set(gca, 'Layer','top');z=0.01;
%set(gca,'FontSize',18,'LineWidth',3,'TickLength',[z z])
hold off;


