function create_messages(nhc,nic,nwc,agent)

%function that populates the global data structure representing
%message information

%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-fox, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
 global MESSAGES
 
 for an=1:length(agent)
     if isa(agent{an},'healthy_cell')
        MESSAGES.atype(an)=1;
        MESSAGES.pos(an,:)=get(agent{an},'pos');
        MESSAGES.infected(an)=2; % 2 = not infected.
     elseif isa(agent{an},'infected_cell')
        MESSAGES.atype(an)=2;
        MESSAGES.pos(an,:)=get(agent{an},'pos');
        MESSAGES.infected(an) = 1;
     elseif isa(agent{an},'white_cell')
        MESSAGES.atype(an)=3;
        MESSAGES.pos(an,:)=get(agent{an},'pos');
        MESSAGES.infected(an)=2;
     else
        MESSAGES.atype(an)=0; 
        MESSAGES.pos(an,:)=[-1 -1];
        MESSAGES.infected(an)=2; % 2 = not infected.
     end
     MESSAGES.dead(an)=0;
     
 end
     
