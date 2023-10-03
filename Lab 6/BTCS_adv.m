function [qnew] = BTCS_adv(qold,dt,dx,u)
% Student name: Rivyesch Ranjan
% Student ID: 29392004
% Date: 4/06/2020

% This function finds a solution for the PDE advection equation using the
% BTCS scheme. It is capable of finding the solution for both positive and
% negative speeds

% The function takens in 4 inputs dt the time step, dx the spatial step, u
% the speed, and qold the initial q condition. It gives a matrix qnew of the q
% solution at the final time step desired

% define the constant to simplify code
C = u*dt/(2*dx);
M = length(qold);
% creating the L matrix 
% for speeds that are positive or zero
 if u>=0
     L = zeros(M,M);
     L(1:1+M:M*M) = 1;
     L(M+1:1+M:M*M) = C;
     L(2:1+M:M*M-M) = -C;
     L(M,M-1) = 0;
 else
     % for negative speed
     L = zeros(M,M);
     L(1:1+M:M*M) = 1;
     L(M+1:1+M:M*M) = C;
     L(2:1+M:M*M-M) = -C;
     L(1,2) = 0;
 end
% specifying the R matrix  
R = qold;
% computing qnew
qnew = L\R;
end