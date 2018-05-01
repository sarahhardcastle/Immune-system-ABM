function [agt, new]=split(agt,cn)

%spliting function for class healthy_cell
%agt=healthy_cell object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT 
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and spliting
%frequency parameters for both foxes and healthy_cells
   
tlim=PARAM.C_SPLIT;         %minimum interval required for spliting
age=agt.age;                %get current agent age
last_split=agt.last_split;  %length of time since agent last reproduced
pos=agt.pos;         %current position

if last_split>=tlim  %if food > threshold and age > interval, then create offspring
   new=healthy_cell(0,pos,PARAM.C_SPD,0);   %new healthy_cell agent
   agt.last_split=0;
   agt.age=age+1;
   IT_STATS.div_r(N_IT+1)=IT_STATS.div_r(N_IT+1)+1;             %update statistics
else                            
    agt.age=age+1;                          %not able to split, so increment age by 1
    agt.last_split=last_split+1;
    new=[];
end