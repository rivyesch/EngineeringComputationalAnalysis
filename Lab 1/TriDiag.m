function [x] = TriDiag( a, b, c, r )
% the following code was done using the reference below and implemented for
% the given question. Variables were changed to mirror those given in the
% question.

% citation: Mark Holmes (2020). tridiag.m (https://www.mathworks.com/matlabcentral/fileexchange/40722-tridiag-m), MATLAB Central File Exchange. Retrieved March 27, 2020. 

% finding the length of the right hand side matrix
len = length(r);
% creating a zero matrix of the dimension needed. i.e. where number of
% row equal to the length of vector r
v = zeros(len,1);
x = v;
w = b(1);
x(1) = r(1)/w;
for i = 2:len
    v(i-1) = c(i-1)/w;
    w = b(i) - a(i) * v(i-1);
    x(i) = (r(i)-a(i)*x(i-1))/w;
end 

for j = len-1:-1:1
    x(j) = x(j) - v(j)*x(j+1);
end 