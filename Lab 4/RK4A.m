function [t,u,nstep,hstep] = RK4A(trange,uinit,f,tol)
% Name: Rivyesch Ranjan
% Student ID: 29392004
% Date: 12/05/2020

% Performing RK4 with stepsize hc
hstep(1) = 0.2;
t = trange(1);
c_err = zeros(1,1);
rich = zeros(2,1);
u1 = zeros(2,1);
u2 = zeros(2,1);
k =0.5; 
c=1.5; 
m=1;
i = 1;
nstep = ones();

while t < trange(2)
% Performing RK4 with stepsize hc once
n = 1;
f_t = f(t(i));
RHS = @(uinit,t) [uinit(2); (f_t/m)-(c/m)*uinit(2)-(k/m)*uinit(1)];
[tnew_hc,u_hc] = RK4_sys(t(i),uinit,RHS,hstep(i),n);
u1(:,i+1) = u_hc(:,end);

% Performing RK4 with stepsize hc/2 twice
hc2 = hstep(i)/2;
n = 2;
[tnew_hc2,u_hc2] = RK4_sys(t(i),uinit,RHS,hc2,n);
u2(:,i+1) = u_hc2(:,end);

% Calculating the computed error
c_err(i+1) = abs(u2(1,i+1)-u1(1,i+1)) ;
 
if c_err < tol
    t(i+1) = t(i) + hstep(i);
    % Calculating the ideal/optimum step size
    hstep(i+1) = 0.9*hstep(i)*(abs(tol/c_err(i+1)))^0.2;
    rich(:,i+1) = (16/15)*u2(:,i+1)-(1/15)*u1(:,i+1);
    uinit = rich(:,i+1);
    % Since the condition is satisfied the iteration continues forward
    i = i+1;
    nstep(1,i) = i;
    % this is done so that the time for which calculations are done does not exceed 
    % the time range stated. Changes the last hstep accordingly. 
    if t(i)+hstep(i)>trange(2)
        hstep(i) = trange(2) - t(i);
    end
else
    % Calculating the ideal/optimum step size and repeating the current
    % iteration 
    hstep(i) = 0.9*hstep(i)*(abs(tol/c_err(i+1)))^0.25;
end  

end
% taking just the first row of u since that is the solution 
u = rich(1,:);
nstep = nstep(end);