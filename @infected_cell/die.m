function [agt,klld]=die(agt,cn)

%death function for class infected_cell
%agt=infected_cell object
%cn - current agent number
%klld=1 if agent dies, =0 otherwise

%infected_celles die if their food level reaches zero or they are older than max_age

global PARAM IT_STATS N_IT MESSAGES

%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both infected_celles and rabbits
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-infected_cell, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
klld=0;
age=agt.age;                %get current agent age

if age>PARAM.C_MAXAGE      %if food level < threshold and age > max age then agent dies
    IT_STATS.died_ic(N_IT+1)=IT_STATS.died_ic(N_IT+1)+1;  %update statistics
    MESSAGES.dead(cn)=1;                %update message list
    klld=1;
end