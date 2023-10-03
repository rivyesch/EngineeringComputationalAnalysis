function [Integral] = Integrate2(f,n_points,xr,yr)
% Author: Rivyesch Ranjan 
% Date: 24/04/2020 

% the function perform a 2D gauss quadrature method to find the volumetric
% flow rate for a 2D velocity flow. It integrates in the x direction first 
% each y points and then finally combines it all by integrating in the y 
% direction too to obtain the final integral

% it produces a signle output which is the final integral which represents
% the volumetric flow rate

% it takes in the following inputs : f which is the function handle for the
% velocity flow, n_points which is the number of gauss quadrature points,
% and xr and yr which is simply the x range and y range respectively of the
% integration

% Defined domain of integration in y
a = yr(1);
b = yr(2);
% Define domain of integration in x
c = xr(1);
d = xr(2);

% calling given function to find the gauss points and its corresponding
% weights
[x, w] = GaussLegendre(n_points);

% Initialize matrix/vector
Integral = 0;
Int_x = 0;

if a==-1 && b==1 && c==-1 && d==1
    for i = 1:n_points
        for j = 1:n_points  
            fxy = f(x(j),x(i));
            I_x = w(j)*fxy;
            Int_x = Int_x + I_x;
        end
        Integral = Integral+ w(i)*Int_x;
    end
    
% when the limits are not -1 and 1 the function has to be rescaled in
% order to use the gauss points and weights correctly
else
    for i = 1:n_points
        y1 = @(x) ((b-a)/2)*x + (b+a)/2;
        for j = 1:n_points
            % for each y value integration is performed in x direction
            y2 = @(x) ((d-c)/2)*x + (d+c)/2;
            fxy = f(y2(x(j)),y1(x(i)));
            I = ((b-a)/2)*fxy*w(j);
            Integral = Integral + I;
        end   
        % now that all the x integration has been done for the y value it
        % is integrated in the y direction 
        Integral = Integral+ w(i)*Int_x;
    end
end
