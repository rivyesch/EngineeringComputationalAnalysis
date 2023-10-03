function [lval] = Li(i,xp,x)
% Name Rivyesch Ranjan
% Date 04/04/2020
% Student ID 29392004

% this function gives an output which is a vector of L values for an 
% entire row by taking in the following as inputs :

% xp is the set of x-values given
% i is used to loop through this function for i number of rows. This is
% done in the LagrangeP function file
% x is the values for which the interpolation is being done

% number of data points
n = length(xp);
% setting up a vector of the size 1 by 100(columns of x) 
lval = ones(1, size(x,2));

    for j = 1:n
        if (i~=j)
            lval(1,:)= lval(1,:) .* (x - xp(j))/(xp(i)-xp(j));
        end
    end
end