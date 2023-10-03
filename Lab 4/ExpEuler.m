function [t,u] = ExpEuler(tspan,uinit,rhs,dt)
% Name: Rivyesch Ranjan
% Student ID:29392004
% Date 10/05/2020

u = zeros();
t = zeros();
u(1) = uinit;
t(1) = tspan(1);
i = 1;

while t(end) < tspan(2)
    % evaluated at time i and solution i (current step)
    u(i+1) = u(i) + dt*rhs(t(i),u(i));
    t(i+1) = t(i)+dt;
    i = i +1;
end
end
