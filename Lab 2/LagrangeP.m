function [yval] = LagrangeP(xp,yp,x)
% Name Rivyesch Ranjan
% Date 04/04/2020
% Student ID 29392004

% this function gives an output which is a vector of y values after
% interpolation for the x values desired by taking in the following as inputs :

% xp is the set of x-values given
% yp is the set of y-values given
% x is the values for which the interpolation is being done

% number of data points
n = length(xp);
% setting up a matrix for the entire interpolation of the size 20 by 100 
lval = ones(size(xp,2), size(x,2));

% runs the Li function which calculates row by row 
for i = 1:n
    lval(i,:) = Li(i,xp,x);
end

yval = 0;

% finds a vector of y values that has been interpolated from the desired
% number of x values
for i = 1:n
    yval = yval + yp(i)*lval(i,:);
end
end

