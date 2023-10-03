% Lab 06 Q4c & Q4d script
% Student name: Rivyesch Ranjan
% Student ID: 29392004
% Date: 9/06/2020

% NOTE: This script must contain codes to solve both Q4c and Q4d
 clear all;close all;
%**********************************************************************
% Input parameters
BCf =@(x,y) exp(1-x.^2-y.^2).*sin(x.^2+y.^2);
alpha = 0.1;

Nx = [21,41,61,81];
Ny = [11,21,31,41];

tmax = 50;
tmin = 0;
dt = [1,50];

%**********************************************************************
% Run for loop for time and for grid points
for i = 1:length(dt)% loop over the two step size
    t = tmin:dt(i):tmax;
    
    for j = 1:length(Nx) % loop over the different Nx and Ny
        
        % Use linspace to generate your grid points in x and in y
        xg = linspace(-1,1,Nx(j));
        yg = linspace(-0.5,0.5,Ny(j));
        
        % finds the time to setup the matrix
        tic
        % Call your MatSetup function
        [L,BC] = MatSetup(Nx(j),Ny(j),xg,yg,alpha,BCf);
        BC = dt(i).*BC;
        % Solve for your
        B = eye(length(L));
        A = eye(length(L)) - dt(i)*L;
        t1(j) = toc;
        
        %finds the time taken for time stepping
        tic
        T = zeros(length(BC),1); % initialising solution matrix
        
        for k = 1:length(t)-1
            T(:,k+1) = (inv(A))*(B*T(:,k) +BC);
        end
        t2(j) = toc;
        
        fprintf('For dt = %.1f when Nx = %.1f and Ny = %.1f\n',dt(i),Nx(j),Ny(j))
        fprintf('time taken for matrix setup %.2f\n',t1(j))
        fprintf('time taken for time stepping was %.2f\n\n',t2(j))
        
        % Need to reshape soln at end time
        Tplot = zeros(Nx(j),Ny(j)); % Initialize variable (Note that Tplot is an Nx x Ny matrix)
        % Set BCs in Qplot
        Tplot(1,:) = BCf(xg(1),yg);  % Call BCf function to substitute in the values at the lower boundary
        Tplot(Nx(j),:) = BCf(xg(end),yg);  % Call BCf function to substitute in the values at the upper boundary
        Tplot(:,1) = BCf(xg,yg(1));  % Call BCf function to substitute in the values at the LHS boundary
        Tplot(:,Ny(j)) = BCf(xg,yg(end));  % Call BCf function to substitute in the values at the RHS boundary
        
        %Inject solution into the grid - transpose because of column
        % storage in MATLAB
        Tplot(2:Nx(j)-1,2:Ny(j)-1) = reshape(T(:,end),Nx(j)-2,Ny(j)-2);
        
        % Now plot (use the syntax given in the lab question)
        % Remember to plot the colorbar
        figure
        clev=linspace(0.25,1,25);  % Set the desired contour levels
        contourf(xg,yg,transpose(Tplot),clev);
        colorbar
        xlabel('x')
        ylabel('y')
        title(sprintf('Solution of q against x and y for dt = %.1f when Nx = %.1f and Ny = %.1f',dt(i),Nx(j),Ny(j)))
        
        
    end
end

% Comments
fprintf('Generally it was found that the matrix setup took a shorter time than the time stepping section\n')
fprintf('As the number of x and number of y points increased the time taken also increased in general. This is\n')
fprintf('because there are more grid points to consider and hence more iterations are needed to solve the problem\n')
fprintf('This requires larger computational memory and power. The time taken will vary from one programmer to another\n')
fprintf('as it is dependent on the laptop hardware and also the efficiency of the matlab code.\n \n')

fprintf('In part d the solution is unconditionally stable. This is because it is based on the BTCS scheme. The only \n')
fprintf('difference between part c and part d is the accuracy of the solution. Generating a solution for the given PDE problem using a\n')
fprintf('much larger time step as done in part d will result in the accuracy being much lower than that in part c which\n')
fprintf('was done for a smaller time step.\n')
fprintf('In general the time taken for the solution is much lower to the previous part. This is expected as when the time step\n')
fprintf('is large fewer iterations are required. The only anomaly to this general trend is for the first Nx and Ny where the time\n')
fprintf('taken was larger compared to the rest\n')