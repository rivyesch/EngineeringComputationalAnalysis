function [q_new] = FTUS(q,dt,dx,u)
% Student name: Rivyesch Ranjan
% Student ID: 29392004
% Date: 4/06/2020

% This function finds a solution for the PDE advection equation using the
% FTCS scheme. It is capable of finding the solution for both positive and
% negative speeds

% The function takens in 4 inputs dt the time step, dx the spatial step, u
% the speed, and q the initial q condition. It gives a matrix q_new of the q
% solution at the final time step desired

% defining a constant to simplify the code
C = u*dt/dx;
m = length(q);

% finding the q solution for subsequent positions 
% for a positive velocity
if u>0
    q_new(1) = 0;
    q_new(2:m) = q(2:m) - C*(q(2:m)-q(1:m-1));
else
    % for a negative velocity
    q_new(end) = 0;
    q_new(1:m-1) = q(1:m-1) - C*(q(2:m)-q(1:m-1));
end
