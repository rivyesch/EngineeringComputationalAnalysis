function [tnew,unew] = RK4_sys(told,uold,RHS,dt,n)
% Name: Rivyesch Ranjan
% Student ID: 29392004
% Date: 11/05/2020

unew = uold;
tnew = zeros();

for i = 1:n
    % finding the following to sub into RK4 formula
    k1 = RHS(uold(:,i),told(i));
    k2 = RHS(uold(:,i)+(dt/2).*k1, told(i)+dt/2);
    k3 = RHS(uold(:,i)+(dt/2).*k2, told(i)+dt/2);
    k4 = RHS(uold(:,i)+dt.*k3, told(i)+dt);
    
    % finding the solution at the next (time) step
    unew(:,i+1) = uold(:,i) + (dt/6).*(k1+2.*(k2+k3)+k4);
    tnew(i+1) = told(i) + dt;
    
    uold(:,i+1) = unew(:,i+1);
    told(i+1) = tnew(i+1);
end
end