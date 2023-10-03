function [t,u] = ImpEuler(tspan,uinit,dt)
% Name: Rivyesch Ranjan
% Student ID:29392004
% Date 10/05/2020

% defining the right hand side function
rhs = @(t,y) -3*y + 6*exp(-t);

u = zeros();
t = zeros();
u(1) = uinit;
t(1) = tspan(1);
i = 1;

while t(end) < tspan(2)
    t(i+1) = t(i)+dt;
    % evaluated at time i+1 and solution i+1 (not applicable for this equ)
    % - future step/ step being calculated for
    u(i+1) = (u(i)+6*dt*exp(-t(i+1)))/(1+3*dt);
    i = i +1;
end
end