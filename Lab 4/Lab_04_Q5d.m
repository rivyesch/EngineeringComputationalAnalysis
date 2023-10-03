% Lab 04 Q5d script
% Name: Rivyesch Ranjan
% Student ID:29392004
% Date 10/05/2020

%**************************************************************************
% This section for Q5d

% Input parameters
dt = [0.05, 0.1, 0.25, 0.5, 1, 2];
%dt = [1 2];
tspan = [0, 20];
rhs = @(t,y) -3*y + 6*exp(-t);
uinit = 1;

t_exact = [0:0.01:20];
y_exact = -2*exp(-3*t_exact) + 3*exp(-t_exact);

figure
for  m = 1:length(dt)

    % Call Explicit Euler
    [t,u] = ExpEuler(tspan,uinit,rhs,dt(m));
        
    % Use subplot command
    % Note that you can use num2str and strcat command to name the title of
    % each subplot according to the different tolerance. See Q4b template

    subplot(2,3,m)
    % Plot results
    plot(t,u,'b')
    hold on
    plot(t_exact,y_exact ,'r')
    xlabel('time (t)')
    ylabel('Explicit Euler Solution (u)')
    title(['Solution for time step of ','',num2str(dt(m))])
    
    
end

% Comment
fprintf('The solution is seen to be stable for time within the time range. For time beyond \n')
fprintf('it the solution is seen to vary greatly with large spikes - big differences in value.\n')
fprintf('The solution can be said to be no longer accurate as it is unstable\n\n')

fprintf('For a small time step dt the solution plot is very close to the exact\n')
fprintf('solution plot whereas for larger dt there is more truncation error resulting in\n')
fprintf('larger differences from the actual solution. This is especially seen for dt = 0.5.\n\n')

pause

%**************************************************************************
% This section for Q5e

figure
for m = 1:length(dt)

    % Call Implicit Euler
    [t,u] = ImpEuler(tspan,uinit,dt(m));
    % Use subplot command
    % Note that you can use num2str and strcat command to name the title of
    % each subplot according to the different tolerance. See Q4b template
    subplot(2,3,m)
    % Plot results
    plot(t,u,'b')
    hold on
    plot(t_exact,y_exact ,'r')
    xlabel('time (t)')
    ylabel('Implicit Euler Solution (u)')
    title(['Solution for time step of ','',num2str(dt(m))])


end

% Comment
fprintf('A major difference is observed after plotting the implicit graphs. For time beyond the time \n')
fprintf('range the solution remains stable as it does not oscillate or spike up and down. In fact it remains\n')
fprintf('identical to the exact solution. Also for the implcit case the solution is more accurate and reflects the\n')
fprintf('actual solution much better for smaller dt values as for these there is a lower truncation error.\n\n')






















