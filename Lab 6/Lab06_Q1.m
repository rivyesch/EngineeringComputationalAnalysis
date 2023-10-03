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
x = linspace(0,10,251);

% Initial condition
q0 = exp(-y*(x-xc).^2);
q0 = transpose(q0);
%**********************************************************************

% Call for loop here to loop over the CFL numbers
dx = x(2)-x(1);
% finds array of dt values for which the solution is calculated for
% different CFL
tstep = CFL*dx/u;

time_exact = [0,20,40,60,80,100];

for j = 1:length(CFL)
    dt = tstep(j);
    % finds all the time levels at which the solution is calculated
    % iteratively
    time = 0:dt:100;
    % initialising variables
    k = 1;
    qold = q0;
    figure
    
    for n=1:length(time)
        % computed q solution
        [qnew] = BTCS_adv(qold,dt,dx,u);
        qold = qnew; 
        % exact q found at the time found in time_exact array
        t = time_exact(k);
        qexact = exp(-y.*((x-u*t)-xc).^2);

        hold on
            % plots calculated q for time that is closest to the exact time
            if time(n)>= t && time(n)~=100
                plot(x,qnew,'b-')
                plot(x,qexact,'g-')
                    k = k+1;
            % plots calculated q for the last exact time t = 100
            elseif time(n) == 100
                plot(x,qnew,'b-')
                plot(x,qexact,'g-')
            end  
    end
    hold off
    title(sprintf('Solution of q against x for CFL = %.1f',CFL(j)))
    xlabel('x')
    ylabel('q')
    legend('computed solution','exact solution','location','best')
    
end


% Comments

fprintf('For each CFL number the stability of the solution is unaffected. From the graph it is seen that\n')
fprintf('all the solutions are stable.This is because the scheme is BTCS which is unconditionally stable. \n')
fprintf('The main difference is that the difference in the exact solution and\n')
fprintf('the numerical solution gets larger as the CFL number increases. Hence the solution obtained is less\n')
fprintf('accurate for larger CFL numbers. It is seen that when CFL is less than 1 it is most accurate.\n')
fprintf('As CFL increases the advected quantity q found decreases over the spatial domain. Further along  \n')
fprintf('the x domain all graphs show a decrease in q and the error gets larger.\n\n')






























