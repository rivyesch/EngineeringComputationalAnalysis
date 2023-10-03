% Q3c script file for Lab02
% Name Rivyesch Ranjan
% Date 07/04/2020
% Student ID 29392004

% Define the data points
xmin = 0;   % smallest value of x
xmax = 8;   % largest value of x
xp = xmin:1:xmax;
yp = xp;
Np = length(xp);

% Define file to be read
fileID = fopen('temperature.dat','r');

% Define the format of the data to read and the shape of the output array.
Dformat = '%f %f';
sizeD = [Np Np];

% Read the file data into array, D (done in column order) 
T = fscanf(fileID,Dformat,sizeD);
fp = T;

% Set up the grids needed.
x = linspace(0,8,30);
y = linspace(0,8,30);

% Since both m and n are the same length
m = Np; 
n = Np;

% Calling the function that does the 2D Interpolation
[fval] = LagrangeP_2D(m,xp,yp,fp,x,y);

% Surface plot of the initial data points given
figure
[xg,yg] = meshgrid(xp,yp); % generates a 2D arrays of data points from the 1D vectors given
surf(xg,yg,T)
title('Surface Plot of Temperature ')
xlabel('x (cm)')
ylabel('y (cm)')
zlabel('Temperature (Celcius)')


figure

% Surface plot of the interpolated data obtained

[xh,yh] = meshgrid(x,y); % generates a 2D arrays of data points from the 1D vectors created
surf(xh,yh,fval)
title('Surface Plot of Temperature after Interpolation ')
xlabel('x (cm)')
ylabel('y (cm)')
zlabel('Temperature (Celcius)')

fprintf('The interpolated surface plot is more detailed. It is obvious that\n')
fprintf('the mesh size is finer(smaller) and hence it is generally more accurate\n')
fprintf('However, just like the previous question the edges have been amplified \n')
fprintf('which is a possibly a sign that there are errors present at the corners of the grid\n')