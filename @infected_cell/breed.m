function [agt,infected]=breed(agt,cn)

%eating function for class infected_cell
%agt=infected_cell object
%cn - current agent number
%eaten = 1 if infected_cell successfully finds a rabbit, =0 otherwise

%SUMMARY OF infected_cell EAT RULE
%infected_cell calculates distance to all rabbits
%infected_cell identifies nearest rabbits(s)
%If more than one equidistant within search radius, one is randomly picked
%Probability of infected_cell killing rabbit =1 - distance of rabbit/speed of infected_cell
%If probability > rand, infected_cell moves to rabbit location and rabbit is
%killed
%If infected_cell does not kill rabbit, it's food is decremented by one unit

%GLOBAL VARIABLES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-infected_cell, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
     
%Modified by D Walker 3/4/08

global  IT_STATS N_IT MESSAGES
   
pos=agt.pos;                        %extract current position 
spd=agt.speed;                      %infected_cell migration speed in units per iteration - this is equal to the food search radius
eaten=0;

typ=MESSAGES.atype;                                         %extract types of all agents
hc=find(typ==1);                                            %indices of all rabbits
rpos=MESSAGES.pos(hc,:);                                     %extract positions of all rabbits
csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);  %calculate distance to all rabbits
[d,ind]=min(csep);                                            %d is distance to closest rabbit, ind is index of that rabbit
nrst=hc(ind);                                                %index of nearest rabbit(s)

if d<=spd&length(nrst)>0    %if there is at least one  rabbit within the search radius        
    if length(nrst)>1       %if more than one rabbit located at same distance then randomly pick one to head towards
        s=round(rand*(length(nrst)-1))+1;
        nrst=nrst(s);
    end
    pk=1-(d/spd);                       %probability that infected_cell will kill rabbit is ratio of speed to distance
    if pk>rand
        nx=MESSAGES.pos(nrst,1);    %extract exact location of this rabbit
        ny=MESSAGES.pos(nrst,2);
        npos=[nx ny];    
        agt.pos=npos;               %move agent to position of this rabbit
        IT_STATS.infected(N_IT+1)=IT_STATS.infected(N_IT+1)+1;                %update model statistics
        infected=1;
        disp(nrst);
        MESSAGES.infected(nrst)=1;       %send message to rabbit so it knows it's dead!
    end
end



   
