function [Integral] = GL_Quad(f,n_points,a,b)
% Author: Rivyesch Ranjan 
% Date: 19/04/2020 

% The function inspects the limits of integration and decides the correct
% approach based on their values. It also calls another function called
% GaussLegrende to obtain the gauss x points and their respective weights.

% The function takes in 3 inputs which are the f which is the function handle 
% being integrated, n_points being the number of gauss points required, and a and
% b are the lower and upper limits of integration respectively

% The function outputs a single value which is the estimate using the gauss 
% quadrature method below


% calling the function to obtain the gauss x points and its correspondng
% weights for a specified n number of points
[x, w] = GaussLegendre(n_points);

Integral = 0; % initialising variable

if a==-1 && b==1
    for i = 1:length(x)
        I = w(i)*f(x(i));
        Integral = Integral + I;
    end
        
else
    % when the limits are not -1 and 1 the function has to be rescaled in
    % order to use the gauss points and weights correctly
    y = @(x) ((b-a)/2)*x + (b+a)/2;
    for i = 1:length(x)
        I = (((b-a)/2)*f(y(x(i))))*w(i);
        Integral = Integral + I;
    end
    
end
end
