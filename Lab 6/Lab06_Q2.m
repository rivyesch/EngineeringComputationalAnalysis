% Lab 06 Q1c script
% Student name: Rivyesch Ranjan
% Student ID: 29392004
% Date: 6/06/2020
clear all;close all;
%**********************************************************************
% Input parameters
u = 0.05;
y = 10;
xc = 2;
CFL = [0.2,1,1.1,5];

% Initial condition
x = linspace(0,10,251);
q0 = exp(-y*(x-xc).^2);
q0 = transpose(q0);
%**********************************************************************

% Call for loop here to loop over the CFL numbers
dx = x(2)-x(1);
tstep = CFL*dx/u;

time_exact = [0,20,40,60,80,100];

for j = 1:length(CFL)
    dt = tstep(j);
    % finds all the time levels at which the solution is calculated
    % iteratively
    time = 0:dt:100;
    % initialising variables
    k = 1;
    q = q0;
    figure
    for n=1:length(time)
        % computed q solution
        [q_new] = FTUS(q,dt,dx,u);
        q = q_new; 
        % exact q found at the time found in time_exact array
        t = time_exact(k);
        qexact = exp(-y.*((x-u*t)-xc).^2);

        hold on
            % plots calculated q for time that is closest to the exact time
            if time(n)>= t && time(n)~=100
                plot(x,q_new,'r-')
                plot(x,qexact,'b-')
                    k = k+1;
            % plots calculated q for the last exact time t = 100
            elseif time(n) == 100
                plot(x,q_new,'r-')
                plot(x,qexact,'b-')
            end  
    end
    hold off
    title(sprintf('Solution of q against x for CFL = %.1f',CFL(j)))
    xlabel('x')
    ylabel('q')
    legend('computed solution','exact solution','location','best')
end


% Comments

fprintf('From the plot it can be seen that the graph become unstable in figure 4 when the CFL=5 which is relatively large.\n')
fprintf('This is justifiable as the scheme being used is explicit which is only conditionally stable. As the CFL is comprised\n')
fprintf('of the time step and spatial step, when the CFL becomes large the time step used exceeds the maximum time step that\n')
fprintf('can be used based on the stability criterion.\n')
fprintf('Also for a CFL of 1 the solution found represents the exact solution the best and the error is very small.\n')
fprintf('For other CFL numbers, the error grows as we move along the x-axis. Also another thing \n')
fprintf('to note is that the calculated solution is larger than the exact solution for CFL smaller than 1\n')
fprintf('whereas for CFL slightly larger than 1 the calculated solution is less than the exact.\n\n')

fprintf('This is true to a certain extent as a smaller time step will yield a more accurate solution. However, after the time step\n')
fprintf('becomes very small the round off error starts to dominate over the truncation error and the overall error might increase\n\n')
