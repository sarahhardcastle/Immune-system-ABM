classdef infected_cell           %declares infected_cell object
    properties         %define infected_cell properties (parameters) 
        age; 
        food;
        pos;
        speed;
        last_infect;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @infected_cell folder. 
        function f=infected_cell(varargin) %constructor method for infected_cell  - assigns values to infected_cell properties
                %f=infected_cell(age,food,pos....)
                %
                %age of agent (usually 0)
                %food - amount of food that rabbit has eaten
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13

            switch nargin                     %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        %create default object
                    f.age=[];			
                    f.food=[];
                    f.pos=[];
                    f.speed=[];
                    f.last_infect=[];
                case 1                         %input is already a infected_cell, so just return!
                    if (isa(varargin{1},'infected_cell'))		
                        f=varargin{1};
                    else
                        error('Input argument is not a infected_cell')
                    end
                case 4                         %create a new infected_cell (currently the only constructor method used)
                    f.age=varargin{1};               %age of infected_cell object in number of iterations
                    f.pos=varargin{2};               %current position in Cartesian co-ords [x y]
                    f.speed=varargin{3};             %number of kilometres infected_cell can migrate in 1 day
                    f.last_infect=varargin{4};        %number of iterations since infected_cell last reproduced.
                otherwise
                    error('Invalid no. of input arguments for infected_cell')
            end
        end
    end
end