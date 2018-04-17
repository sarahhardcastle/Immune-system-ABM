function c=set(c,prop_name,val)

%standard function to allow insertion of memory parameters from fox object

switch prop_name
   
case 'pos'
    c.pos=val; 
case 'age'
   c.age=val;
case 'speed'
   c.speed=val; 
case 'last_infect'
   c.last_infect=val; 
otherwise 
   error('invalid field name')
end

