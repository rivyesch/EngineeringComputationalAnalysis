function [a,b,c,r] = set_coeff(N)
% This functions sets tridiagonal matrix coefficients 
% a,b,c (lower diagm diag, upper diag) and calculates a RHS
% vecor r.
% To be used for Lab 1 MAE/MEC3456 2020
% Author: M. Rudman 
% Date 11 March 2020


a=ones(N, 1); a(1) = 0;
b=-3*ones(N, 1);
c=ones(N, 1); c(N)=0;


A=diag(a(2:N),-1)+diag(b,0)+diag(c(1:N-1),1);
x=linspace(-20, 20, N);
x=x';
r=A*x;

end

