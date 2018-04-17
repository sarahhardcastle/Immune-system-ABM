function [agt,eaten]=eat(agt,cn)

%eating function for class white_cell
%agt=white_cell object
%cn - current agent number
%eaten = 1 if white_cell successfully finds a pathogen, =0 otherwise

%SUMMARY OF white_cell EAT RULE
%white_cell calculates distance to all pathogens
%white_cell identifies nearest pathogens(s)
%If more than one equidistant within search radius, one is randomly picked
%Probability of white_cell killing pathogen =1 - distance of pathogen/speed of white_cell
%If probability > rand, white_cell moves to pathogen location and pathogen is
%killed
%If white_cell does not kill pathogen, it's food is decremented by one unit

%GLOBAL VARIABLES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=pathogen, 2-white_cell, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
     
%Modified by D Walker 3/4/08

global  IT_STATS N_IT MESSAGES
   
pos=agt.pos;                        %extract current position 
spd=agt.speed;                      %white_cell migration speed in units per iteration - this is equal to the food search radius
eaten=0;

typ=MESSAGES.atype;                                         %extract types of all agents
rb=find(typ==1);                                            %indices of all pathogens
rpos=MESSAGES.pos(rb,:);                                     %extract positions of all pathogens
csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);  %calculate distance to all pathogens
[d,ind]=min(csep);                                            %d is distance to closest pathogen, ind is index of that pathogen
nrst=rb(ind);                                                %index of nearest pathogen(s)

if d<=spd&length(nrst)>0    %if there is at least one  pathogen within the search radius        
    if length(nrst)>1       %if more than one pathogen located at same distance then randomly pick one to head towards
        s=round(rand*(length(nrst)-1))+1;
        nrst=nrst(s);
    end
    pk=1-(d/spd);                       %probability that white_cell will kill pathogen is ratio of speed to distance
    if pk>rand
        nx=MESSAGES.pos(nrst,1);    %extract exact location of this pathogen
        ny=MESSAGES.pos(nrst,2);
        npos=[nx ny];    
        agt.pos=npos;               %move agent to position of this pathogen
        IT_STATS.eaten(N_IT+1)=IT_STATS.eaten(N_IT+1)+1;                %update model statistics
        eaten=1;
        MESSAGES.dead(nrst)=1;       %send message to pathogen so it knows it's dead!
    end
end

   
