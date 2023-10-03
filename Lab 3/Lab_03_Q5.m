% Script for Lab 03 Q5 script  2020
% Name Rivyesch Ranjan
% Date 27/04/2020

% The following file calculates the volumetric flow rate for a 2D velocity
% problem. It does this using the Gauss Legrende method for a specified
% number of points. Also, the intergral/volumetric flow rate is calculated
% for different aspect ratios whilst keeping the cross sectional area constant

fprintf('\n\n  Starting Q 5 \n \n')

% number of gauss points
n_points = 20;
Integral = zeros();
aspect_ratio = [1,0.5,0.25,0.125,0.0625];

i = 0;
for beta = [1,0.5,0.25,0.125,0.0625]
    i = i+1;
    a = sqrt(1/beta);
    b = sqrt(beta);
    f = @(x,y) Wxy(x,y,a,b);
    xr = [0 a];
    yr = [0 b];
    Integral(i) = Integrate2(f,n_points,xr,yr);
    fprintf('Integral is %f when beta is %0.4f\n',Integral(i),beta)
end

figure
plot(aspect_ratio,Integral)
title('Volumetric Flow Rate vs Aspect Ratio')
xlabel('Aspect ratio')
ylabel('Volumetric Flow Rate')

fprintf('\n\n')
fprintf('20 gauss points was chosen as from question 4 it can be seen that beyond 10 gauss points the error is significantly less\n\n')
fprintf('The graph obtained illustrates that the largest volumetric flow rate is achieved when\n')
fprintf('the aspect ratio is 1\n\n')

fprintf('\n  ****************** END Q5 ******************\n\n')


    