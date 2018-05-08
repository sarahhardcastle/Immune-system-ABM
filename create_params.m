function create_params

%set up breeding, migration and starvation threshold parameters. These
%are all completely made up!

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.C_SPD=5;         %speed of movement - units per itn (rabbit)
    PARAM.WC_SPD=5;         %speed of movement - units per itn (fox)
    PARAM.C_SPLIT=10;      %cell split frequency
    PARAM.WC_SPLIT=20;
    PARAM.INFECT_RATE=40;
    PARAM.C_MAXAGE=120;      %maximum age allowed 
    PARAM.WC_MAXAGE=120;
    PARAM.F_BRDFQ= 2;
    