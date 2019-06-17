% Main script for simulating a thalamocortical circuit.
% The cortical area contains two local circuits (one for L2/3 and one for L5/6)
% The thalamic module is just a nonlinear inhibitory population
% Jorge Jaramillo 2018
% Jorge F. Mejias, 2018
%
%   ----------------

format short;
clear all;
close all;
clc;rng(538193);  %938193, 938195, 738193



%we introduced the inhibitory pulvinar population as a fifth population in
%the laminar circuit, recurrently connected to L5E.

%parameters and initial conditions, uncoupled:
Nareas=1;Gpulv=0;
par=parameters(Gpulv);mydeal(par);
%simulation:
Iext=[10;0;10;0;6]; %r2e r2i r5e r5i rpulv
rate=trial(par,Iext,Nareas,0);
re2=rate(1,:);re5=rate(3,:);
eta=0.6;LFP=re2*(1-eta)+re5*eta; %eta=0.6
[p20p,f20]=analysis(par,re2,30);
[p50p,f50]=analysis(par,re5,3);
[p90p,f90]=analysis(par,LFP,3);
z=500;p20=smooth(p20p,z);p50=smooth(p50p,z);p90=smooth(p90p,z);%z=300
mfr2u=mean(re2);mfr5u=mean(re5);

%parameters and initial conditions, coupled:
Nareas=1;Gpulv=0.5;
par=parameters(Gpulv);mydeal(par);
%simulation:
Iext=[10;0;10;0;6]; %r2e r2i r5e r5i rpulv
rate=trial(par,Iext,Nareas,0);
re2=rate(1,:);re5=rate(3,:);
eta=eta;LFP=re2*(1-eta)+re5*eta; %eta=0.6, above
[p21p,f21]=analysis(par,re2,30);
[p51p,f51]=analysis(par,re5,3);
[p91p,f91]=analysis(par,LFP,3);
p21=smooth(p21p,z);p51=smooth(p51p,z);p91=smooth(p91p,z);
mfr2c=mean(re2);mfr5c=mean(re5);


%now the figure:
figpulvinar;








