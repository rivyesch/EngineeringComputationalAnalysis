function mat4bvp(lambda)

solinit = bvpinit(linspace(-pi/2,pi/2,10),@mat4init,lambda);
sol = bvp4c(@mat4ode,@mat4bc,solinit);
fprintf('The fourth eigenvalue is approximately %7.3f.\n',...
        sol.parameters)

xint = linspace(-pi/2,pi/2);
Sxint = deval(sol,xint);
plot(xint,Sxint(1,:))
%axis([0 pi -1 1.1])
title('Eigenfunction of Mathieu''s equation.') 
xlabel('x')
ylabel('solution y')
% ------------------------------------------------------------
function dydx = mat4ode(x,q,lambda)
dydx = [  q(2)
         -lambda*q(1) + q(1)*(sin(x))^2 ];
% ------------------------------------------------------------
function res = mat4bc(qa,qb,lambda)
res = [  qa(1) 
         qb(1) 
        qa(2)-1 ];
% ------------------------------------------------------------
function yinit = mat4init(x)
yinit = [  sin(2*x)
          2*cos(2*x) ];