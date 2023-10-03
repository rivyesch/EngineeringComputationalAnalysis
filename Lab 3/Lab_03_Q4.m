% Script for Lab 03 Q4 2020
% Author: Rivyesch Ranjan 
% Date: 17/04/2020   
% What this does

fprintf('\n\n  Starting Q 4 \n \n')
%Q4b-1+2

fprintf('Since the analytic solution is given in part c for Q4, part 3 can be performed\n')
fprintf('and if the integral is close to the analytical answer then the function works\n')
fprintf('Also it can be seen if the integral value converges for increasing n to the solution given\n\n')

fprintf('\n Firstly a simple situation can be simulated where the \n')
fprintf('number of gauss points, upper and lower limit is specified for a known function handle\n')
fprintf('This can then be hand calculated to verify that it works. \n\n')

%Q4b-3

% initialising the constant variables
G=1; K=1; b=1; n=0.5;
a = 0;

% vector of number of gaussian quadrature points
n_p = [2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];

% specifying function handle
f = @(y) (n/(n+1))*(G/K)^(1/n)*((b/2)^((n+1)/n)-abs(y-(b/2))^((n+1)/n));

% Now calculate the integral for power law channel flow
Integral = zeros();

for i = 1:length(n_p)
    n_points = n_p(i);
    Integral(i) = GL_Quad(f,n_points,a,b);
end

%Q4c 

% analytical solution for flow rate at given n (=0.5)
Q = 0.03125;
% calculates error between analytical and numerical solution for each
% iteration of gaussian quadrature points
error = abs(Integral - Q);

% plotting 
figure
loglog(n_p, error,'ro','MarkerFaceColor','r')
xlabel(' number of gauss points (n_p)','FontSize',16)
ylabel(' Error','FontSize',16)
title(' Relationship between error as a function of Gauss Points','FontSize',16)
set(gca,'FontSize',16);

fprintf('The plot clearly shows that for a small number of gauss points used\n')
fprintf('the error will be relatively larger. As the gauss points used increases\n')
fprintf('the error becomes relatively smaller, hence decreases\n')
fprintf('The trend on the log scale graph is almost linear\n')

fprintf('\n  ****************** END Q4 ******************\n\n')


    