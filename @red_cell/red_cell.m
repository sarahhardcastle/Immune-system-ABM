classdef red_cell   %declares red blood cell object
    properties    %define rabbit properties (parameters) 
        age; 
        pos;
        speed;
        last_split;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @rabbit folder. 
        function r=red_cell(varargin) %constructor method for rabbit - assigns values to rabbit properties
                %r=rabbit(age,food,pos....)
                %
                %age of agent (usually 0)
                %food - amount of food that rabbit has eaten
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13


                switch nargin           %Use switch statement with nargin,varargin contructs to overload constructor methods
                    case 0				%create default object
                       r.age=[];	
                       r.pos=[];
                       r.speed=[];
                       r.last_split=[];
                    case 1              %input is already a rabbit, so just return!
                       if (isa(varargin{1},'red_cell'))		
                            r=varargin{1};
                       else
                            error('Input argument is not a red_cell')
                            
                       end
                    case 4               %create a new rabbit (currently the only constructor method used)
                       r.age=varargin{1};               %age of rabbit object in number of iterations
                       r.pos=varargin{2};               %current position in Cartesian co-ords [x y]
                       r.speed=varargin{3};             %number of kilometres rabbit can migrate in 1 day
                       r.last_split=varargin{4};        %number of iterations since rabbit last reproduced.
                    otherwise
                       error('Invalid no. of input arguments')
                end
        end
    end
end
