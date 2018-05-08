function initialise_results(nhc,nic,nwc,nsteps)

 global  IT_STATS ENV_DATA 
 
%set up data structure to record statistics for each model iteration
%IT_STATS  -  is data structure containing statistics on model at each
%iteration (number of agents etc)
%ENV_DATA - data structure representing the environment 
 
 IT_STATS=struct('div_r',[zeros(1,nsteps+1);],...            %no. births per iteration
                'div_f',[zeros(1,nsteps+1)],...
                'died_wc',[zeros(1,nsteps+1)],...			%no. agents dying per iteration
                'died_ic',[zeros(1,nsteps+1)],...	
                'died_hc',[zeros(1,nsteps+1)],...		
                'infected',[zeros(1,nsteps+1)],...              %no. rabbits eaten per iteration
                'eaten',[zeros(1,nsteps+1)],... 
                'mig',[zeros(1,nsteps+1)],...                %no. agents migrating per iteration
                'tot',[zeros(1,nsteps+1)],...				%total no. agents in model per iteration
                'tot_hc',[zeros(1,nsteps+1)],...             % total no. rabbits
                'tot_ic',[zeros(1,nsteps+1)],...             % total no. rabbits
                'tot_wc',[zeros(1,nsteps+1)],...             % total no. foxes
                'tfood',[zeros(1,nsteps+1)]);               %remaining vegetation level
            
 
 tf=sum(sum(ENV_DATA.food));            %remaining food is summed over all squares in the environment
 IT_STATS.tot(1)=nhc+nic+nwc;
 IT_STATS.tot_hc(1)=nhc;
 IT_STATS.tot_ic(1)=nic;
 IT_STATS.tot_wc(1)=nwc;
 IT_STATS.tfood(1)=tf;
