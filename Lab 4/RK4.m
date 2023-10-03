function [tnew,unew] = RK4(told,uold,RHS,dt,n)
% Name: Rivyesch Ranjan
% Student ID:29392004
% Date 07/05/2020

% setting the first value of unew and tnew as uold and told
unew = uold;
tnew = told; 

for m = 1:n
    % for each time step the following are calculated 
    k1 = RHS(tnew(m),unew(m));
    k2 = RHS(tnew(m)+dt/2, unew(m)+k1*dt/2);
    k3 = RHS(tnew(m)+dt/2, unew(m)+k2*dt/2);
    k4 = RHS(tnew(m)+dt, unew(m)+k3*dt);
    
    % the solution for the next time step is found
    unew(m+1) = unew(m) + (dt/6)*(k1+2*k2+2*k3+k4);
    tnew(m+1) = tnew(m) + dt;
end
end
