% Q2 lab 01 M3456 S1 2020
% Rivyesch Ranjan
% 29392004

fprintf("\n\n Q2 \n\n")
close all; clear all; 

%specify function handles for f, g, h
    f = @(x,y,z) y^2 + z^2 - x;
    g = @(x,y,z) x^2 + z^2 - y;
    h = @(x,y,z) x^2 + y^2 - z;

%specify function handles for derivatives
    df_dx = -1;
    df_dy = @(y) 2*y;
    df_dz = @(z) 2*z;
    
    dg_dx = @(x) 2*x;
    dg_dy = -1;
    dg_dz = @(z) 2*z;
    
    dh_dx = @(x) 2*x;
    dh_dy = @(y) 2*y;
    dh_dz = -1;

% 2 different inital guesses ...

r(1,:) = [0.3,0.3,0.3];
r(2,:) = [0.1,0.1,0.1];

M=size(r);

% creating a variable that consist the stated tolerance of 10^-6
tol = 10^-6;

 for i=1:M(1)
     
     % to perform the code for two seperate guesses mentioned above 
     r0 = r(i,:);
     
     % calling the function created to determine the root and the number of
     % iterations that was required to find the root
     [root,iter] = NR_3D(r0,f,g,h, df_dy,df_dz,dg_dx,dg_dz,dh_dx,dh_dy, tol);
  
    % output of the results of the iteration
    if iter <= 100
        fprintf('Initial guess is (%.1f,%.1f,%.1f)\n',r0(1),r0(2),r0(3))
        fprintf('Intersection point found: (%.6f,%.6f,%.6f)\n',root(1),root(2),root(3))
        fprintf('Number of iterations needed is: %d\n\n',iter)
    end
 end
 
 
 fprintf('The root found is correct as when the root is substituted into the functions f,g and h they are all equal to each other.\n')
 fprintf('The root is found to the specified accuracy by using the while loop in the function. The criteria specified is that as long\n') 
 fprintf('as the difference is larger than the specified tolerance the loop will keep going, hence the iteration will proceed until \n')
 fprintf('the difference is less than the tolerance. \n\n')
 
 fprintf('Both guesses result in the same intersection point or root.\n')
 fprintf('This is expected since for both guesses it is the same three functions that are being used\n\n')
 
 fprintf('The number of iterations required were different for both guesses. This makes sense as the guess\n')
 fprintf('that was closer to the root found (shown above) required fewer iterations\n\n')
 
 fprintf('If the root does not converge, the function will not be able to determine a root even after a lot of iterationns.\n')
 fprintf('Hence, if the root is not found after 100 iterations the loop breaks and a message is printed saying no root found.\n')
 fprintf('This is done using the IF statement.\n')