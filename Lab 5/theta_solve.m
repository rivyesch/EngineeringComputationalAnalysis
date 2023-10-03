function [tsol, qsol] = theta_solve(tmax, q0,dx,dt,kappa,theta)
% Name : Rivyesch Ranjan
% Student ID : 29392004
% Date : 25/05/2020

% This function is the theta-scheme integrator for the heat eqn.
% Essentially the L,R and BC matrix are constructed by matrix indexing
% since the matrix had been already found in its general form in part (a).
% Then the matrix is solved for q at the next time step using equation 7
% from lab 5 question manual

% the size of the matrix is 100 by 100 as we start from j=1 on a pen-paper
% reference grid approach
M = 100;
qsol(:,1) = q0(2:end,1);

% defining the L matrix 
a = 1+kappa*(dt/dx^2)*(1+theta);
b = (-kappa/2)*(dt/dx^2)*(1+theta);
c = (-kappa/2)*(dt/dx^2)*(1+theta);
d = -kappa*(dt/dx^2)*(1+theta);

L = zeros(M,M);
L(1:1+M:M*M) = a;
L(M+1:1+M:M*M) = b;
L(2:1+M:M*M-M) = c;
L(M,M-1) = d;

% defining the R matrix
e = 1-kappa*(dt/dx^2)*(1-theta);
f = (kappa/2)*(dt/dx^2)*(1-theta);
g = (kappa/2)*(dt/dx^2)*(1-theta);
h = kappa*(dt/dx^2)*(1-theta);

R = zeros(M,M);
R(1:1+M:M*M) = e;
R(M+1:1+M:M*M) = f;
R(2:1+M:M*M-M) = g;
R(M,M-1) = h;

% defining the BC matrix
BC = zeros(M,1);
BC(1,1) = kappa*(dt/dx^2)*q0(1);

% looping through to find the solution at every time step. The tmax
% is set at 20 and no solution is evaluated for any time level beyond this
i = 1;
tsol(i) = 0;
while tsol(end)+dt<=tmax
qsol(:,i+1) = (L\R)*qsol(:,i) + L\BC;
tsol(i+1) = tsol(i)+dt;
i = i+1;
end

end

