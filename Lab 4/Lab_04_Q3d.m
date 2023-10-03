% Lab 04 Q3d script
% Name: Rivyesch Ranjan
% Student ID: 29392004
% Date: 11/05/2020

% Input parameters
told = 0;
x0 = 1.5;
uold = [x0 ; 0];
dt = [1 0.5 0.1];

% Run for loop for different values of dt
for M = 1:length(dt)
    
    % Solve for Case 1
    k =0.5; 
    c=1.5; 
    m=1;
    % finds number of steps to undertake for different dt from 0 s to 30 s
    n = (30-0)/dt(M); 
    RHS_1 = @(uold,t) [uold(2); -(c/m)*uold(2)-(k/m)*uold(1)];
    [tnew_1,unew_1] = RK4_sys(told,uold,RHS_1,dt(M),n);

    % Solve for Case 2
    k =1.5; 
    c=0.5; 
    m=1;
    n = (30-0)/dt(M);
    RHS_2 = @(uold,t) [uold(2); -(c/m)*uold(2)-(k/m)*uold(1)];
    [tnew_2,unew_2] = RK4_sys(told,uold,RHS_2,dt(M),n);

    % plotting case 1 and case 2 for a secific dt on same graph
    figure(M)
    plot(tnew_1,unew_1(1,:))
    hold on
    plot(tnew_2,unew_2(1,:))
    legend('case1','case2')
    xlabel('time (t)')
    ylabel('x solution')
    title(['Solution for time step of ','',num2str(dt(M))])
    
end



% Comment

fprintf('The first thing noticed is that the plot for case 1 for each of the three dt\n')
fprintf('stop oscillating quickly. They settle down fast. This is because the damping \n')
fprintf('effect is stronger compared to force due to the spring. Case 2 on the other hand\n')
fprintf('which has relatively small damping constant oscillates for a longer time\n')
fprintf('before reaching equilibrium.\n\n')


fprintf('observing the 3 figures, it is clear that the solutions obtained for\n')
fprintf('the different time steps are generally the same/identical. This is because\n')
fprintf('all three figures have the same shape and trend. The difference is the \n')
fprintf('resolution. The graph for the smallest dt is smooth whilst the larger dt\n')
fprintf('exhibit more straight pointed features. This is due to there being fewer\n')
fprintf('points to plot for as number of steps taken is fewer than that of smaller dt\n\n')

