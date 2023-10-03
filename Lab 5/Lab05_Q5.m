% Lab05_Q5 script
% M. Rudman May 2020

% Name : Rivyesch Ranjan
% Student ID : 29392004
% Date : 23/05/2020

close all; clear all; clc;

% Set Q5 values that are fixed, kappa, xmax, etc.
kappa = 1;
tmax = 20;
x = linspace(0,10,101);
dx = x(2)-x(1);
q(x>5) = 1;
q(x<=5) = -1;
q(1) = 1;
q0 = transpose(q);

%Q5c 
dtmaxC = 0.5*dx^2;
fprintf('The time step restriction for FTCS is %.4f\n',dtmaxC)
theta = -1.0;
dt(1) = dtmaxC*0.5;
dt(2) = dtmaxC*0.99;
dt(3) = dtmaxC*1.001;

%Solve for each dt and plot
t = [0 4 8 12 16 20];

for i=1:length(dt)
    
    
    % Calculate solution for each specific dt
    [tsol, qsol] = theta_solve(tmax, q0,dx,dt(i),kappa,theta);
    
    % Plot the solution at nline times
    figure
    for j = 1:length(t)
        Time = sprintf('Time = %0.1f',t(j));
        [~,col1] = (min(abs(tsol - t(j))));
        qplot = [1;qsol(:,col1)];
        plot(x,qplot,'Displayname',Time)
        hold on
    end
    legend('Location','best')
    axis([0 x(end) -inf inf])
    xlabel('x','Fontsize',14)
    ylabel('q solution','Fontsize',14)
    Header = sprintf('dt = %0.3e',dt(i));
    title(Header,'Fontsize',16)
    set(gca,'FontSize',14);
end

fprintf('\n\n Q5c : My results show that for the first two timesteps that are less than the FTCS scheme time  \n')
fprintf('step restriction calculated the results are stable. For the third timestep which violate this stability\n')
fprintf('criteria it is clear to see that the graph oscillates wildly proving that it is unstable. For increasing x\n')
fprintf('the oscillations and amplitude of this instability grows.\n\n')
fprintf('The FTCS scheme is inefficient in comparison to the other 2 methods used as there is a restriction on the time\n')
fprintf('step used. To obtain a stable result a very small time step might have to be used and this could be time consuming\n')
fprintf('and also use a lot of computational memory as it would require considerably more steps and iterations to produce the\n')
fprintf('desired output.\n')
fprintf('\n *************************************************************\n')



%Q5d - Crank-Nicolson scheme

theta = 0;
dt(1) = 0.5;
dt(2) = 1;
dt(3) = 2;

% Solve and plot 
for i=1:length(dt)
    % Calculate solution for each specific dt
    [tsol, qsol] = theta_solve(tmax, q0,dx,dt(i),kappa,theta);
    
    % Plot the solution at nline times
    figure
    for j = 1:length(t)
        Time = sprintf('Time = %0.1f',t(j));
        [~,col2] = (min(abs(tsol - t(j))));
        qplot = [1;qsol(:,col2)];
        plot(x,qplot,'Displayname',Time)
        hold on
    end
    legend('Location','best')
    axis([0 x(end) -inf inf])
    xlabel('x','Fontsize',14)
    ylabel('q solution','Fontsize',14)
    Header = sprintf('dt = %0.3e',dt(i));
    title(Header,'Fontsize',16)
    set(gca,'FontSize',14);
end

fprintf('\n\n  The solutions for CN that the solution is unconditionally stable. This is evident from the \n') 
fprintf('graphs where for increasing timesteps the solution does not turn unstable and oscillate wildly unlike\n')
fprintf('in part c. For higher time steps there is a more significant change in the solution where it can be seen\n')
fprintf('the decay or drop off or increase at certain regions is more steep/drastic. For increasing dt the solution \n')
fprintf('was less accurate as there were more oscillating errors\n')
fprintf('The dt used in this part d is actually higher than the calculated dtmaxC showing the the time step used does\n')
fprintf('matter or affect the stability of the solution obtained\n')
fprintf('\n **********************************************************\n')


%Q5e - thete scheme

theta = 0.1;
dt(1) = 0.5;
dt(2) = 1;
dt(3) = 2;

% Solve and plot 
for i=1:length(dt)
    % Calculate solution for each specific dt
    [tsol, qsol] = theta_solve(tmax, q0,dx,dt(i),kappa,theta);
    
    % Plot the solution at nline times
    figure
    for j = 1:length(t)
        Time = sprintf('Time = %0.1f',t(j));
        [~,col3] = (min(abs(tsol - t(j))));
        qplot = [1;qsol(:,col3)];
        plot(x,qplot,'Displayname',Time)
        hold on
    end
    legend('Location','best')
    axis([0 x(end) -inf inf])
    xlabel('x','Fontsize',14)
    ylabel('q solution','Fontsize',14)
    Header = sprintf('dt = %0.3e',dt(i));
    title(Header,'Fontsize',16)
    set(gca,'FontSize',14);
end

fprintf('\n\n  The solutions for theta scheme is always stable as there are no wild oscillations even \n') 
fprintf('when the dt was increased to a value above the dtmaxC calculated in part .For higher\n')
fprintf('dt values, the same characteristics were observed as explained in part c. However, there was an\n')
fprintf('improvement in the plot where there were less drastic differences in the plot for different dt.\n')
fprintf('To a certain extent it did remove oscillation errors that were seen in the CS scheme\n')
fprintf('\n **********************************************************\n')
