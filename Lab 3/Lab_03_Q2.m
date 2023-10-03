% Script Lab_03_Q2.m file
%
% Author: Rivyesch Ranjan 
% Date: 17/04/2020   

fprintf('\n\n  Starting Q 2 \n \n')

G=1; K=1; b=1; n=0.5;
xrange = [0 b];
S_T = zeros();
nlev = zeros();

% Function handle for Q2 
f = @(y) (n/(n+1))*(G/K)^(1/n)*((b/2)^((n+1)/n)-abs(y-(b/2))^((n+1)/n));

% Q2b answer
tolerance = [10^-2,10^-3,10^-4,10^-5,10^-6,10^-7,10^-8];

i = 0;
for tol = [10^-2,10^-3,10^-4,10^-5,10^-6,10^-7,10^-8]
i = i+1;
[S_T(i),nlev(i)] = R_Trap(f,xrange,tol);
end

figure
loglog(tolerance, nlev,'ro','MarkerFaceColor','r')
xlabel(' Error Tolerance, n','FontSize',16)
ylabel(' Number of Segments','FontSize',16)
title(' Number of Segments vs Error Tolerance','FontSize',16)
set(gca,'FontSize',16);

fprintf('From the plot it is seen that as the tolerance is smaller a greater number of iterations, and hence segments are required. \n')
fprintf('The error is directly proportional to the square of the step size. The step size is inversely proportional to number of \n')
fprintf('points and number of points is simply the number of segments (n) plus 1\n\n\n')


% Q2c answer

tol = 10^-6;
n_val = [0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6];

for iter = 1:length(n_val)
    n = n_val(iter);
    f = @(y) (n/(n+1))*(G/K)^(1/n)*((b/2)^((n+1)/n)-abs(y-(b/2))^((n+1)/n));
    [S_T(iter),nlev(iter)] = R_Trap(f,xrange,tol);
end

figure
plot(n_val,S_T)
xlabel('Flow Index (n)')
ylabel('Volumetric Flow Rate')
title('Volumetric Flow Rate vs Flow Index')

fprintf('The volumetric flow rate from n=0.2 to n=1.6 is analysed. It is noticed that as the flow index (n) increases, \n')
fprintf('so does the volumetric flow rate. The overall general trend of the plot is almost linear. On closer inspection \n')
fprintf('the initial stage is perfectly linear. After n=0.4 onwards it transitions to a quadratic with a very slow gradual \n')
fprintf('changing gradient (not steep slope)\n\n\n')

fprintf('\n  ****************** END Q2 ******************\n\n')
    





