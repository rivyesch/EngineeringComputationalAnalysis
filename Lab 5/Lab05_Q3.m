% Lab05_Q3 script
% Name : Rivyesch Ranjan
% Student ID : 29392004
% Date : 16/05/2020

close all; clear all; clc;

%Q3b - calculate and plot qRHS for 0<lambda<50

% specifying the range of lambda
lambda_vals = [0:0.2:50];

% finds the qRHS solution at pi/2 for every lambda value
for i = 1:length(lambda_vals)
    lambda = lambda_vals(i);
    [qRHS] = BValR(lambda);
    BC_RHS(i)= qRHS;
end

plot(lambda_vals,BC_RHS,'LineWidth',2);
xlabel(' \lambda ','Fontsize',14);
ylabel(' q_{rhs} ','Fontsize',14);
title(' RHS value as fcn of \lambda ','Fontsize',16);
% drawing a line through q=0 as this is the final q value at the rhs. where
% the plots intersect represent the eigenvalues to this problem
line([0 50],[0 0],'Color','r')

% Q3c - find and print eigenvalues
f_q = zeros();
brackets = zeros();
n = 1;
% the following loop finds the brackets automatically from the BC_RHS
% vector by detecting change in sign
for j = 1:length(BC_RHS)-1
    if BC_RHS(j)*BC_RHS(j+1)<0
        f_q(n) = BC_RHS(j);
        brackets(n) = lambda_vals(j);
        f_q(n+1) = BC_RHS(j+1);
        brackets(n+1) = lambda_vals(j+1);
        n = n+2;
    end
end

% performing the bisection root finding method to find the roots within all
% the brackets found earlier
current_loop = 1;
EPS = 10^-4;
z = 1;
for k = 1:2:(length(brackets)-1)
    f_xr = 10;
    xl = brackets(k);
    f_xl = f_q(k);
    xu = brackets(k+1);
    f_xu = f_q(k+1);
    while(abs(f_xr)>EPS)
        xr = (xu+xl)/2;
        f_xr = BValR(xr);
        
        if ((f_xu*f_xr)>0)
            xu = xr;
            f_xu = BValR(xu);
        else
            xl = xr;
            f_xl = BValR(xl);
        end
        current_loop = current_loop +1;
    end
    root(z) = xr; % the roots are the eigenvalues to this problem
    z = z+1;
end

fprintf('The roots were found using bisection method after all the brackets or bounds were found\n\n')
fprintf('The first eigenvalue is %.5f\n',root(1))
fprintf('The second eigenvalue is %.5f\n',root(2))
fprintf('The third eigenvalue is %.5f\n',root(3))
fprintf('The fourth eigenvalue is %.5f\n',root(4))
fprintf('The fifth eigenvalue is %.5f\n',root(5))

%Q3d - calculate eigen solutions for required  eigenvalues

x = [-pi/2 pi/2];
IC = [0 1];

ODE1 = @(x,q) [  q(2); -root(1)*q(1) + q(1)*(sin(x))^2 ];
ODE2 = @(x,q) [  q(2); -root(2)*q(1) + q(1)*(sin(x))^2 ];
ODE4 = @(x,q) [  q(2); -root(4)*q(1) + q(1)*(sin(x))^2 ];

[X1,Y1] = ode45(ODE1,x,IC);
[X2,Y2] = ode45(ODE2,x,IC);
[X4,Y4] = ode45(ODE4,x,IC);
legend

figure
hold on
plot(X1,Y1(:,1),'r');
plot(X2,Y2(:,1),'b');
plot(X4,Y4(:,1),'g');
legend('1st eigen solution','2nd eigen solution','4th eigen solution','Location','best');
xlabel('x')
ylabel('q')
title('Eigen Solution for the 1st, 2nd and 4th Eigen Value')

