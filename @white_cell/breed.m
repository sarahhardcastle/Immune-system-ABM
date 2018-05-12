function [agt,new]=breed(agt,cn)

%breeding function for class white_cell
%agt=white_cell object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both white_celles and rabbits

   
tlim = PARAM.WC_SPLIT;         %minimum interval required for breeding
age = agt.age;                 %get current agent age
last_breed = agt.last_breed;   %length of time since agent last reproduced
pos = agt.pos;                 %current position

if last_breed >= tlim
   new = white_cell(0,pos,PARAM.WC_SPD,0);   %new white_cell agent
   agt.last_breed = 0;
   agt.age = age + 1;
   IT_STATS.div_f(N_IT+1) = IT_STATS.div_f(N_IT+1)+1;             %update statistics
else
    agt.age = age + 1;          %not able to breed, so increment age by 1
    agt.last_breed = last_breed + 1;
    new = [];
end