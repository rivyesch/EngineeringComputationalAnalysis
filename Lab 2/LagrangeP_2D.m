function [fval] = LagrangeP_2D(m,xp,yp,fp,x,y)
% Name Rivyesch Ranjan
% Date 06/04/2020
% Student ID 29392004

% this function gives a grid of data of interpolated temperature readings
% for the respective x and y values that it was interpolated from 
% by taking in the following as inputs :

% xp is the set of x-values given
% yp is the set of y-values given
% m is the length of the variable xp or yp 
% fp is the grid of temperature readings given that the interpolation was
% based on 
% x is the values for which the interpolation is being done
% y is the values for which the interpolation is being done

%interpolating in the x direction first
for i = 1:m
    yval(i,:) = LagrangeP(xp,fp(i,:),x);
end

% next interpolating in the y direction using the temperature values found 
% in the interpolation just done above
 for j = 1:length(x)
     fval(:,j) = LagrangeP(yp,transpose(yval(:,j)),y); % gives the fully interpolated grid of temperature data
 end
 
end

