function [Vel] = Wxy(x,y,a,b)
% Calculates 2D channel flow velocity using a series expansion

m=11;  n=11;  beta=b/a;

% m,n MUST be odd - so make sure they are
m = 2*floor(m/2)+1;   n = 2*floor(n/2)+1;
nm = floor(m/2+1);  nn = floor(n/2+1);

Terms = zeros(nm, nn);
xsin=zeros(1,n);  ysin = zeros(1,m); 

% Calculate sin values

for j=1:nm
    ysin(j) = sin((2*j-1)*pi*y/b);
end
for i = 1:nn
    xsin(i) = sin((2*i-1)*pi*x/a);
end

for j=1:nm
    jj = 2*j-1;
    for i = 1:nn
        ii = 2*i-1;
        Terms(j,i) = xsin(i)*ysin(j)/((ii*jj)*(ii^2 + jj^2/beta^2));
    end
end

Vel = (16*a^2/pi^4) * sum(sum(Terms));

end

