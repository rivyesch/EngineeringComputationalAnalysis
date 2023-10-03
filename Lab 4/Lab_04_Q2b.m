% Lab 04 Q2b script
% Name: Rivyesch Ranjan
% Student ID:29392004
% Date 07/05/2020

%**********************************************************************
% This section for Q2b
% Input parameters
y0 = 0.15;
theta = 45;
d = 0.005;
g = 9.81;

% The right hand side function is given by
RHS = @(t,y) -(((tand(theta))^2)/y^1.5)*((d^2)/4)*sqrt(2*g);

% the time range
t1 = 0;
t2 = 120;

% dt is the various time steps for which the function is run and solution found
dt = [40,20,10,5];

told = 0;
uold = y0;

% Calculate exact solution
t_exact = 0:0.5:120;
y_exact = zeros();
for j = 1:length(t_exact)
    y_exact(1,j) = (y0^2.5 - ((5*(d^2)*(tand(theta))^2)/8)*(sqrt(2*g))*t_exact(j))^0.4;
end

% Plotting the exact solution
plot(t_exact,y_exact)
hold on
title('Solutions of y for t=0 to t=120')
xlabel('time(t)')
ylabel('y')

% Finding the solution and plotting for different dt speicified above using
% RK4 method
for i = 1:length(dt)
    n = (t2-t1)/dt(i);
    [tnew,unew] = RK4(told,uold,RHS,dt(i),n);
    plot(tnew,unew,'--')
end

legend('Exact','40','20','10','5')

% Comment
fprintf('The graph shows that for a smaller dt(time step), the solution is more accurate.\n')
fprintf('This is evident as the lines for smaller dt are nearer to the exact solution line plot whereas those\n')
fprintf('relatively larger dt are further away and exhibit a larger error/deviance from the true value\n\n')
fprintf('If the dt is smaller the truncation error is relatively smaller too. Hence, it will reflect the exact\n')
fprintf('solution much better. The solutions found for each iteration will be more accurate \n\n')

pause

%**********************************************************************
% This section for Q2c
dt = 0.2;
t2 = 140;
n = ceil((t2-t1)/dt);
[tnew_2c,unew_2c] = RK4(told,uold,RHS,dt,n);

for z = 1:length(tnew_2c)
    if unew_2c(z) <= 0.001
        t_2c = tnew_2c(z);
        break
    end
end

fprintf('The water level in the funnel is at 0.001 m at time %0.1f seconds\n\n',t_2c)

% Comment
fprintf('Using the given analytical solution and substituting the values given\n')
fprintf('for y0, d, g and theta we find that the time at which the water level is\n')
fprintf('0.001 m is 125.9100 seconds\n\n')



































