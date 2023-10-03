function [qRHS] = BValR(lambda) 
% Name : Rivyesch Ranjan
% Student ID : 29392004
% Date : 16/05/2020

% This function uses ODE45 to integrate a system of 1st order ODEs given a
% guess for the eigenvalue lambda. Boundary conditions are specified. A
% guess had to be made for the initial boundary condition of the 2nd
% equation and this guess was of the value 1.

x = [-pi/2 pi/2];
lambda;
ODE = @(x,q) [  q(2); -lambda*q(1) + q(1)*(sin(x))^2 ];

% at -pi/2 BC given for q is 0. However as the 2nd equation guess was not
% provided a guess of value 1 was made ( the value does not matter)
IC = [0 1];

[XX,YY] = ode45(ODE,x,IC);

% since the solution required is when q is pi/2 or at the end of the domain
% the last value was taken and for the 1st column as this corresponds
% directly to the 1st equation which is what we are solving for/desire.
qRHS = YY(end,1);
end