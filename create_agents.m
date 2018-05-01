function [agent]=create_agents(nhc,nic,nwc)

 %creates the objects representing each agent
 
%agent - cell array containing list of objects representing agents
%nr - number of red blood cells
%np - number of pathogens
%nw - number of white blood cells

%global parameters
%ENV_DATA - data structure representing the environment (initialised in
%create_environment.m)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation
 
 global ENV_DATA MESSAGES PARAM 
  
bm_size=ENV_DATA.bm_size;
hcloc=(bm_size-1)*rand(nhc,2)+1;      %generate random initial positions for healthy cell
icloc=(bm_size-1)*rand(nic,2)+1;      %generate random initial positions for infected cell
wcloc=(bm_size-1)*rand(nwc,2)+1;      %generate random initial positions for white cells

MESSAGES.pos=[hcloc;icloc;wcloc];

%generate all cell agents and record their positions in ENV_MAT_R
for hc=1:nhc
    pos=hcloc(hc,:);
    %create healthy cell agents with random ages between 0 and 10 days and random
    %food levels 20-40
    age=ceil(rand*PARAM.C_MAXAGE);
    last_split=round(rand*PARAM.C_SPLIT);
    agent{hc}=healthy_cell(age,pos,PARAM.C_SPD,last_split);
end

%generate all fox agents and record their positions in ENV_MAT_F
for ic=nhc+1:nhc+nic
    pos=icloc(ic-nhc,:);
    %create infected cell agents with random ages between 0 and 10 days and random
    %food levels 20-40
    age=ceil(rand*PARAM.C_MAXAGE);
    last_infect=round(rand*PARAM.INFECT_RATE);
    agent{ic}=infected_cell(age,pos,PARAM.C_SPD,last_infect);
end

for wc=nhc+nic+1:nhc+nic+nwc
    pos=wcloc(wc-(nhc+nic),:);
    %create white cell agents with random ages between 0 and 10 days
    age=ceil(rand*PARAM.WC_MAXAGE);
    last_split=round(rand*PARAM.WC_SPLIT);
    agent{wc}=infected_cell(age,pos,PARAM.C_SPD,last_split);
end
