% Main program to obtain the GC and coherence figure.
%
% The system is constituted by two areas (V4 and IT) and a pulvinar
% population (PulvV4) connecting V4 to IT.
%
% There's also a PulvIT population that will project to higher areas, but
% it's not relevant for us aside for the local effect on IT alpha
%
% This code takes the coherence data generated from maingc (in its four
% possibilities) and plots the coherence gamma peaks together for
% comparison purposes.
%
% Jorge Jaramillo
% Jorge F. Mejias, 2018
%
%   ----------------


clear all;close all;
format short;clc;
rng(938197);Nareas2=2;
%Iext is [V4e2 ITe2; V4i2 ITi2; V4e5 ITe5; V4i5 ITi5, PulvV4 PulvIT]
%Iext=6.*[1 1;0 0;1 1;0 0;0 0]; %inject at both


att=0; %1 means attention in, 0 means attention out
pulvinar=0; %1 means healthy, 0 means lesioned (no pulvinar present)
gammapeak=zeros(4,1);

%first, coherence:
figure(1);k=1;
for att=1:-1:0
    
    for pulvinar=1:-1:0
    
    %we open the corresponding dataset:
    load(sprintf('attpulv%d%d.mat',att,pulvinar));
    
    
    cohp=mean(pcoh0,1);cohf=mean(fcoh0,1);
    plot(cohf,cohp,'LineWidth',4,'Color',[1-k/4 .2 k/4]);hold on;
    k=k+1;
    
    end
    
end
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03]);
set(gca,'box','off');xlabel('Frequency (Hz)');ylabel('Coherence');
legend({'Att In, healthy','Att In, lesioned','Att Out, healthy','Att Out, lesioned'});
ylim([0 0.3]);xlim([0 80]);


%now GC:
figure(2);k=1;
for att=1:-1:0
    
    for pulvinar=1:-1:0
    
    %we open the corresponding dataset:
    load(sprintf('attpulv%d%d.mat',att,pulvinar));
    
    
    dt=par.binx*par.dt;
    z1to2=squeeze(f0(2,1,:));
    frequ0=1:1:length(z1to2);nyq=2*length(z1to2)*dt;
    frequ0=frequ0./nyq;
    %resolution:
    frequ=frequ0(1:resbin:end);
    GC1to2=z1to2(1:resbin:end);
    plot(frequ,GC1to2,'Color',[1-k/4 k/4 .2],'LineWidth',4);hold on;
    %cohp=mean(pcoh0,1);cohf=mean(fcoh0,1);
    %plot(cohf,cohp,'LineWidth',4,'Color',[1-k/4 .2 k/4]);hold on;
    k=k+1;
    
    end
    
end
set(gca,'FontSize',20,'LineWidth',5,'TickLength',[0.03 0.03]);
set(gca,'box','off');xlabel('Frequency (Hz)');ylabel('Granger causality (FF)');
legend({'Att In, healthy','Att In, lesioned','Att Out, healthy','Att Out, lesioned'});
ylim([0 0.3]);xlim([0 80]);



%The GC gamma peak from V4 to IT goes from larger to smaller in this
%sequence, according to our simulations (XY, with X=att and Y=pulv):

% 11 > 10 > 01 > 00

