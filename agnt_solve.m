function [nagent,nn]=agnt_solve(agent)

%sequence of functions called to apply agent rules to current agent population.
%%%%%%%%%%%%
%[nagent,nn]=agnt_solve(agent)
%%%%%%%%%%%
%agent - list of existing agent structures
%nagent - list of updated agent structures
%nn - total number of live agents at end of update

%Created by Dawn Walker 3/4/08 

n=length(agent);    %current no. of agents
n_new=0;    %no. new agents
prev_n=n;   %remember current agent number at the start of this iteration

%execute existing agent update loop
for cn=1:n
	curr=agent{cn};
    disp(curr);
    
    if isa(curr,'healthy_cell')||isa(curr,'infected_cell')||isa(curr,'white_cell')
        curr = migrate(curr,cn);
        
        [curr,killed] = die(curr,cn);
        if killed==0
            new=[];
            [curr,new] = breed(curr,cn);
            
            if isa(curr, 'white_cell')
                [curr, eaten] = eat(curr, cn);
            end
            
            if isa(curr,'healthy_cell') || isa(curr,'white_cell')
                if ~isempty(new)
                    n_new=n_new+1;
                    agent{n+n_new}=new;
                end
            end
        end
    end
end

temp_n=n+n_new; %new agent number (before accounting for agent deaths)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.

