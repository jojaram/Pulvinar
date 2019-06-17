%figure for cortico-pulvinar simulation




figure('Position',[400 400 1800 1000]);
subplot(2,3,1);q=4;
loglog(f21,p21,'Color',[0.3 0.7 0.3],'LineWidth',q);hold on;
loglog(f20,p20,'Color',0.5*[0.3 0.7 0.3],'LineWidth',q);
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03]);
xlabel('Frequency (Hz)');
ylabel('L2/3 power');
lh=legend('Pre-inj','Post-inj');
set(lh,'FontSize',20,'box','off');
xlim([1 100]);set(gca,'box','off');

subplot(2,3,2)
loglog(f51,p51,'Color',[0.99 0.45 0.1],'LineWidth',q);hold on;
loglog(f50,p50,'Color',0.5*[0.99 0.45 0.1],'LineWidth',q);
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03]);
xlabel('Frequency (Hz)');
ylabel('L5/6 power');
lh=legend('Pre-inj','Post-inj');
set(lh,'FontSize',20,'box','off');
xlim([1 100]);set(gca,'box','off');

subplot(2,3,3)
loglog(f91,p91,'Color',[0.1 0.45 0.99],'LineWidth',q);hold on;
loglog(f90,p90,'Color',0.5*[0.1 0.45 0.99],'LineWidth',q);
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03]);
xlabel('Frequency (Hz)');
ylabel('LFP power (laminar average)');
lh=legend('Pre-inj','Post-inj');
set(lh,'FontSize',20,'box','off');
xlim([1 100]);set(gca,'box','off');





subplot(2,3,4)
bar(1,mfr2c,'FaceColor',[0.3 0.7 0.3],'LineWidth',3);hold on;
bar(2.25,mfr2u,'FaceColor',0.5*[0.3 0.7 0.3],'LineWidth',3);
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03]);
tope=max(mfr2u,mfr2c);ylim([0,tope*1.75]);set(gca,'XTick',[1 2.25]);
set(gca,'XTickLabel',{'Pre','Post'})
ylabel('L2/3 mean firing rate');set(gca,'box','off');


subplot(2,3,5)
bar(1,mfr5c,'FaceColor',[0.99 0.45 0.1],'LineWidth',3);hold on;
bar(2.25,mfr5u,'FaceColor',0.5*[0.99 0.45 0.1],'LineWidth',3);
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03]);
tope=max(mfr5u,mfr5c);ylim([0,tope*1.75]);set(gca,'XTick',[1 2.25]);
set(gca,'XTickLabel',{'Pre','Post'})
ylabel('L5/6 mean firing rate');set(gca,'box','off');






