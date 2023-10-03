% Lab 04 Q4b script
% Name: Rivyesch Ranjan
% Student ID: 29392004
% Date: 12/05/2020

% Input parameters
tol = [1e-4 1e-5 1e-6 1e-7];
F0 = 1;
w = 2.5;
trange = [0 30];
f = @(t) F0*cos(w*t);
x0 = 1.5;
uinit = [x0 ; 0];
% Run for loop for different tolerances
for i = 1:length(tol)
    % Call RK4A
    [t,u,nstep,hstep] = RK4A(trange,uinit,f,tol(i));
    fprintf('For a tolerance of %0.2d number of steps taken was %u\n',tol(i),nstep(end))
    % Plot results
    % You may use the example below to help you. You need to replace the
    % variables to plot with the correct variables.
    figure
        ax = plotyy(t,u(1,:),t,hstep);
        xlabel('time')
        ylabel(ax(1),'x Solution')
        ylabel(ax(2),'Time step ')
        titleplot = strcat('tol = ',num2str(tol(i)));
        title(titleplot)
        legend('x solution','step size')
        hold on
end

% Comment
fprintf('\n')
fprintf('Firstly the numerical solution obtained from the RK4 method is nearly\n')
fprintf('similar/identical for each of the dt for which the function is called for.\n\n')

fprintf('The step size changes frequently in all the plots. However, it is for the\n')
fprintf('smallest tolerance that the number of steps taken is largest whilst the larger\n')
fprintf('tolerance required fewer number of steps taken. This is illustrated where\n')
fprintf('for the smallest tolerance the steps taken line oscillates more frequently(higher frequency)\n\n')

fprintf('Also from the plots it is seen that for a smaller tolerance the step size required are much smaller\n')
fprintf('and range from 0.08 to 0.13 approximately. Contrastingly for the largest tolerance\n')
fprintf('selected the time step ranges from around 0.29 to 0.4 generally\n\n')
