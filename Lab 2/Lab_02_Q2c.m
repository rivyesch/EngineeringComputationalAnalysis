% Q2c script file for Lab02
% Name Rivyesch Ranjan
% Date 29/03/2020
% Student ID 29392004

% citation :
% Carlo Castoldi (2020). Lagrange polynomial interpolation (https://www.mathworks.com/matlabcentral/fileexchange/899-lagrange-polynomial-interpolation), MATLAB Central File Exchange. Retrieved March 29, 2020. 

% Set up function f(x)

f = @(xp) 1./(1+20.*xp.^2);

% Set up 20 equidistant points and evaluate f(x)
xp = linspace(-1,1,20);
yp = f(xp);

% Set up  100 points within [-1 1]
x = linspace(-1,1,100);

% Interpolate

%[lval] = Li(i,xp,x)
[yval] = LagrangeP(xp,yp,x);

% Plot and comment
figure
plot(xp,yp,'ro')
hold on
plot(x,yval,'b')

title('y versus x graph from x=-1 to x=1')
xlabel('x')
ylabel('y')
legend('Actual Plot Markers','Interpolated Plot')

fprintf('From the figure obtained it is observed that the interpolated values and its corresponding\n')
fprintf('graph is generally accurate around most regions except for at the very start and the very end. \n')
fprintf('An error can be seen in the x range of -1 to -0.8 and 0.8 to 1. The error is most significant when x is in the ranges\n')
fprintf('-0.89 to -1 and 0.89 to 1. Other than that it mirrors the main equations.\n')