% Script Lab_01_Q3.m file
% Rivyesch Ranjan
% 29392004

fprintf("Q3 \n\n")

close all; clear all; 

% set up system coefficients

% the question states the value of N chosen is 1000
N=1000;

% calling the set_coeff function provided to get the coefficients of the
% tridiagonal matrix and the vector r
[a,b,c,r] = set_coeff(N);

% solve the system for x
[x] = TriDiag( a, b, c, r );
% Creating a new matrix B using the same method done in set_coeff function
% file
B = diag(a(2:N),-1)+diag(b,0)+diag(c(1:N-1),1);

% specifiying a tolerance to test accuracy of results determind.
% tolerance of 10^-6 is used just like in Q2
tol = 10^-6;

% multiplying the matrices to get the new r value(s)
r_new = B*x;
% comparing to the initial r (see lines below)
r_old = r;

Diff = r_new - r_old;
if Diff < tol
    fprintf('Correct Answer Found\n\n')
else
    fprintf('Wrong Asnwer Found!\n\n')
end

fprintf('The difference between the new r( determined from solution) and the initial r is found.\n')
fprintf('The tolerance chosen is 10^-6 and as long as the difference is less than the tolerance the answer is correct.\n')
