classdef white_cell          %declares white_cell object
    properties         %define white_cell properties (parameters) 
        age;
        pos;
        speed;
        last_split;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @white_cell folder. 
        function f=white_cell(varargin) %constructor method for white_cell  - assigns values to white_cell properties
                %f=white_cell(age,food,pos....)
                %
                %age of agent (usually 0)
                %food - amount of food that rabbit has eaten
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13

            switch nargin                     %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        %create default object
                    f.age=[];	
                    f.pos=[];
                    f.speed=[];
                    f.last_split=[];
                case 1                         %input is already a white_cell, so just return!
                    if (isa(varargin{1},'white_cell'))		
                        f=varargin{1};
                    else
                        error('Input argument is not a white_cell')
                    end
                case 4                          %create a new white_cell (currently the only constructor method used)
                    f.age=varargin{1};               %age of white_cell object in number of iterations
                    f.pos=varargin{2};               %current position in Cartesian co-ords [x y]
                    f.speed=varargin{3};             %number of kilometres white_cell can migrate in 1 day
                    f.last_split=varargin{4};        %number of iterations since white_cell last reproduced.
                otherwise
                    error('Invalid no. of input arguments for white_cell')
            end
        end
    end
end