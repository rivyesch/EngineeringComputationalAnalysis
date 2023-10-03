% Script Lab_03_Q3.m file
%
% Author: Rivyesch Ranjan 
% Date: 19/04/2020   

fprintf('\n\n  Starting Q 3 \n \n')

G=1; K=1; b=1; n=0.5;
f = @(y) (n/(n+1))*(G/K)^(1/n)*((b/2)^((n+1)/n)-abs(y-(b/2))^((n+1)/n));

xrange = [0 b];
S_R = zeros();
nlev = zeros();

tol = [10^-2,10^-3,10^-4,10^-5,10^-6,10^-7,10^-8,10^-9,10^-10,10^-11,10^-12];

for i = 1: length(tol)
    [S_R(i),nlev(i)]= Romberg(f, xrange, tol(i));
    fprintf('The number of segments required was %i for an error less than %0.2d\n',nlev(i),tol(i))
end

figure
loglog(tol, nlev,'ro','MarkerFaceColor','r')
xlabel(' Error Tolerance','FontSize',16)
ylabel(' Number of Segments','FontSize',16)
title(' Number of Segments vs Error Tolerance','FontSize',16)
set(gca,'FontSize',16);

Q = 0.03125;
actual_error = abs(Q-S_R);
figure
loglog(tol, actual_error,'ro','MarkerFaceColor','r')
hold on
loglog(tol, tol,'bo','MarkerFaceColor','b')
xlabel(' Error Tolerance','FontSize',16)
ylabel(' Error','FontSize',16)
legend('Actual Tolerance','Error Tolerance','Location','northwest')
title(' Number of Segments vs Error Tolerance','FontSize',16)
set(gca,'FontSize',16);

fprintf('\n\n')
fprintf('For the number of segments vs error tolerance graph there is a general trend\n')
fprintf('where more steps are required to achieve a tighter tolerance(smaller). \n')
fprintf('It should be noted that the shape looks like steps where for two or three \n')
fprintf('different tolerances the number of steps needed are the same\n\n\n')

fprintf('From the second figure it is clear that the actual tolerance is generally\n')
fprintf('less than the error tolerance. This could be because the code was looped\n')
fprintf('until the difference between two corresponding integral solutions was less than\n')
fprintf('the error tolerance specified as an input to the function\n\n\n')



fprintf('Comparing the graphs from Q2 and Q3 it is clear to see that rhomberg method\n')
fprintf('requires fewer iterations/steps to achieve the same tolerance as compared to Trapezoidal Rule\n')
fprintf('For example, rhomberg only requires 6 steps to find an answeer of 10^-8 tolerance (half relatively)\n')
fprintf('whereas trapezoidal required 12 steps for the same tolerance to be achieved.\n')






fprintf('\n  ****************** END Q3 ******************\n\n')






