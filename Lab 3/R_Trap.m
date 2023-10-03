function [S_T,nlev] = R_Trap(f,xrange,tol)
% Author: Rivyesch Ranjan 
% Date: 17/04/2020 

% Changed S_T to I

% The below function calculates the estimate for a recursive trapezoidal
% rule of the given function over the range of limits stated. The code
% repeats until the difference between the previous estimate and latest
% estimate is not more than the tolerance specified.

% Takes in inputs f which is the function handle to be integrated, xrange 
% which is the limits of intergration and tol which is the tolerance or  
% difference between the previous estimate and latest estimate

% Gives two ouputs S_T which is the recursive trapezoidal estimate and nlev
% is the number of times the initial range (xrange) has been halved.


% obtaining the two outer limits of intergration
a1 = xrange(1);
b1 = xrange(end);
% initialising variables
I = zeros();
nlev = 0;
diff = 10^6; % any large value to start the while loop

% Obtain estimate for just one segment j=0
first = 0.5*(b1-a1)*(f(a1)+f(b1));

while diff>tol
     % counter for number of iterations
    nlev = nlev+1;
    % h is distance between 1st x point and the next one from the xrange
    h = (xrange(2)-a1); 
    new_x = a1 + 0.5*h; % finds first new x point
    new_val = f(new_x); % corresponding f values
    xrange = sort([xrange new_x]); %adds new x points to range of known x points and sorting from small to big
    
    % for j = 1 done this way to overcome matrix indexing issues
    if nlev == 1
        I(nlev) = 0.5*first + ((b1-a1)/(2*2^(nlev-1)))*new_val;
        diff = I(nlev)-first;
        continue
    end
    
    % the for loop is done from the 2nd iteration onwards (j=2 and beyond)
   while new_x + h < 1
        % finds the 2nd x point and onwards for however many that exist
        new_x = new_x + h;
        latest_find = f(new_x);
        % sums up all the f values including the first one found in line 19
        new_val = new_val+latest_find;
    end
    
    I(nlev) = 0.5*I(nlev-1) + ((b1-a1)/(2*2^(nlev-1)))*new_val;
    % finds difference in S_T between current iteration and previous iteration
    diff = I(nlev)-I(nlev-1);
   
end
% takes the end of the vector as it is the final integration ans after all the iterations  
S_T = I(end);
% % minus 1 to counterbalance the additional 1 added even after the ans is
% % satisfactory and complying of the tolerance
% nlev = nlev-1;
end

