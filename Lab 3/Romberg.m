function[S_R,nlev]= Romberg(f, xrange, tol)
% Author: Rivyesch Ranjan 
% Date: 24/04/2020 

% the function perform a Rhomberg Integration for the function handle
% within the given limits. It iterates contiuosly until the difference
% between subsequent integral solutions from the current iteration and the
% previous one is less than the specified tolerance stated

% it produces a two output which is S_R the final integral and nlev which
% is the count for the number of iterations performed to obtain the final
% answer.

% it takes in the following inputs : f which is the function handle,
% xrange which states the limits of integral and tol which is the desired
% tolerance to be achieved between subsequent integral solutions.

% obtaining the two outer limits of intergration
a1 = xrange(1);
b1 = xrange(end);
% initialising variables
%tolerance = zeros();
S_R = zeros();
nlev = 0;
diff = 10^6;
% Obtain estimate for just one segment j=0
first = 0.5*(b1-a1)*(f(a1)+f(b1));
S_R(1,1) = first;

while diff>tol
    nlev = nlev + 1;
    h = (xrange(2)-a1) ;
    new_x = a1 + 0.5*h ;
    new_val = f(new_x);
    xrange = sort([xrange new_x]);
    
    if nlev == 1
        S_R(2,1) = 0.5*first + ((b1-a1)/(2))*new_val;
        S_R(2,2) = ((4)*S_R(2,1) - S_R(1,1))/(3);
        diff = abs(S_R(end,end)-first);
        continue
    end
    
    while new_x + h < 1
        % finds the 2nd x point and onwards for however many that exist
        new_x = new_x + h;
        latest_find = f(new_x);
        % sums up all the f values including the first one found in line 19
        new_val = new_val+latest_find;
    end
    
    S_R(nlev+1,1) = 0.5*S_R(nlev,1) + ((b1-a1)/(2*2^(nlev-1)))*new_val;
    
    j = length(S_R(:,1));
    for k = 2:j
        S_R(j,k) = ((4^(k-1))*S_R(j,k-1) - S_R(j-1,k-1))/(4^(k-1)-1);
    end
    diff = abs(S_R(end,end)-S_R(end-1,end-1));
end

S_R = S_R(end,end);
end

    