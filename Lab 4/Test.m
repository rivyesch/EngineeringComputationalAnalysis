clear all; close all; clc

y0 = 0.15;
theta = 45;
d = 0.005;
g = 9.81;

t_exact = 0:0.5:130;
y_exact = zeros();
for j = 1:length(t_exact)
    y_exact(1,j) = (y0^2.5 - ((5*(d^2)*(tand(theta))^2)/8)*(sqrt(2*g))*t_exact(j))^0.4;
end

plot(t_exact,y_exact)