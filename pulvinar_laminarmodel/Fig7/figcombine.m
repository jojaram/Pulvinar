%combine both figures:

figure('Position',[600,400,1200,1000]);
hold on;resbin=20; %for long series, pick one value every 'resbin' ones.



%preinjection:
load preinjection.mat;

%GC plot, V4-IT:
subplot(2,2,1)
dt=par.binx*par.dt;
z2to1=squeeze(f0(1,2,:));z1to2=squeeze(f0(2,1,:));
frequ0=1:1:length(z1to2);nyq=2*length(z1to2)*dt;
frequ0=frequ0./nyq;
%resolution:
frequ=frequ0(1:resbin:end);
GC1to2=z1to2(1:resbin:end);GC2to1=z2to1(1:resbin:end);
plot(frequ,GC1to2,'Color',[0.3 0.7 0.3],'LineWidth',4);hold on;
plot(frequ,GC2to1,'Color',[0.99 0.45 0.1],'LineWidth',4);hold on;
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03])
set(gca,'box','off');legend('V4 to IT','IT to V4');xlim([0 80]);
zgc=1.1*max(max(z2to1),max(z1to2));ylim([0 zgc]);%ylim([0 0.25]);
set(gca,'Layer','top');ylabel('Granger causality');xlabel('Frequency (Hz)');
title('Pre-injection');


%coherence plot, V4-IT
subplot(2,2,3)
cohp=mean(pcoh0,1);
cohpsig=std(pcoh0,1);
cohf=mean(fcoh0,1);
myeb2(cohf,cohp,cohpsig,[0 0 1])
%set(gca,'FontSize',18,'LineWidth',3,'TickLength',[0.01 0.01]);
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03]);
set(gca,'box','off');xlabel('Frequency (Hz)');ylabel('Coherence');
zc=1.1*max(cohp+cohpsig);
ylim([0 zc]);xlim([0 80]);



%postinjection:
load postinjection.mat;

%GC plot, V4-IT:
subplot(2,2,2)
dt=par.binx*par.dt;
z2to1=squeeze(f0(1,2,:));z1to2=squeeze(f0(2,1,:));
frequ0=1:1:length(z1to2);nyq=2*length(z1to2)*dt;
frequ0=frequ0./nyq;
%resolution:
frequ=frequ0(1:resbin:end);
GC1to2=z1to2(1:resbin:end);GC2to1=z2to1(1:resbin:end);
plot(frequ,GC1to2,'Color',[0.3 0.7 0.3],'LineWidth',4);hold on;
plot(frequ,GC2to1,'Color',[0.99 0.45 0.1],'LineWidth',4);hold on;
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03])
set(gca,'box','off');legend('V4 to IT','IT to V4');xlim([0 80]);
zgc=1.1*max(max(z2to1),max(z1to2));ylim([0 zgc]);%ylim([0 0.25]);
set(gca,'Layer','top');ylabel('Granger causality');xlabel('Frequency (Hz)');
title('Post-injection')

%coherence plot, V4-IT
subplot(2,2,4)
cohp=mean(pcoh0,1);
cohpsig=std(pcoh0,1);
cohf=mean(fcoh0,1);
myeb2(cohf,cohp,cohpsig,[0 0 1])
%set(gca,'FontSize',18,'LineWidth',3,'TickLength',[0.01 0.01]);
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03]);
set(gca,'box','off');xlabel('Frequency (Hz)');ylabel('Coherence');
zc=1.1*max(cohp+cohpsig);
ylim([0 zc]);xlim([0 80]);















