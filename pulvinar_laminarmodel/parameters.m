% parameters for the model:

function [par]=parameters(Gpulv)


% We put all the relevant parameters in the parameter structure "par":
%transduction function parameters are inside their corresponding functions.
%time constants, in seconds:
par.dt=0.2e-3;par.triallength=300.;par.transient=10.; %6000 looks best
sc2=1.;%with 1, gamma freq is around 35 to 50 Hz
sc5=5.;%with 5, alpha freq is around 8 to 10 Hz
par.tau=[0.006*sc2 0.015*sc2 0.006*sc5 0.015*sc5 0.015*sc2]; %re2 ri2 re5 ri5 pulv
%taui5=25ms(beta),30~40ms(alpha)
par.tstep=((par.dt)./(par.tau))';
sig=0.3.*[1 1 1.5 1.5 1.25];
par.tstep2=(((par.dt.*sig.*sig)./(par.tau)).^(0.5))';



% local and interlaminar synaptic coupling strengths:
% J2e=0.5*0;      % L2/3 excit to L5 excit
% J2i=0.;       % L2/3 excit to L5 inhib
% J5e=0.;       % L5 excit to L2/3 excit
% J5i=0.1*0;       % L5 excit to L2/3 inhib. 0.2, if you want !=0
mm=1.;
J2e=1.*mm;       % L2/3 excit to L5 excit
J2i=0.;       % L2/3 excit to L5 inhib
J5e=0.;       % L5 excit to L2/3 excit
J5i=0.75*mm;     % L5 excit to L2/3 inhib. 0.2, if you want !=0

par.J=zeros(5,5);
%local, layer 2:
par.J(1,1)=1.5;par.J(1,2)=-3.25;
par.J(2,1)=3.5;par.J(2,2)=-2.5;
%local, layer 5:
par.J(3,3)=1.5;par.J(3,4)=-3.25;
par.J(4,3)=3.5;par.J(4,4)=-2.5;
%inter-laminar:
par.J(3,1)=J2e;par.J(4,1)=J2i;
par.J(1,3)=J5e;par.J(2,3)=J5i;
%cortico-pulvinar:
par.J(5,3)=1*Gpulv;
par.J(1,5)=0.3*Gpulv;
par.J(2,5)=0.2*Gpulv;
par.J(3,5)=0.1*Gpulv;
par.J(4,5)=1.3*Gpulv;


%par.J(1,3)=-0.2*Gpulv;

%background inputs:
par.inputbg=[0.; 0.; 0.; 0.; 0.]; %re2 ri2 re5 ri5 rpulv















