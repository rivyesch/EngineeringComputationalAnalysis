function [L,BC] = MatSetup(Nx,Ny,xg,yg,alpha,BCf)
% Student name: Rivyesch Ranjan
% Student ID: 29392004
% Date: 4/06/2020

% This function creates the L matrix and BC matrix by applying a stencil to
% every interior unkown point. It checks for any boundary conditions
% present at every unkown grid point and allocates the coefficient terms
% appropriately

nn = @(j,k,Nx) (j-1)+(k-2)*(Nx-2);
BC = zeros((Nx-2)*(Ny-2),1);
L = zeros((Nx-2)*(Ny-2),(Nx-2)*(Ny-2));

% finds the spatial steps in the x and y directions
dx = xg(2)-xg(1);
dy = yg(2)-yg(1);

% doing the for loop only for the interior grid points that are unkown
for k = 2:Ny-1
    for j = 2:Nx-1
        % defining a global numbering system for the unknown grid points
        in = nn(j,k,Nx);
        L(in,in) = -2*alpha*((1/dx^2)+(1/dy^2)); %diagonal term always exist Tjk
        
        %checking if there are points on boundary
        
        if j>2 % does not have any BC to the left
            ir = nn(j-1,k,Nx); %finds the left term contribtuion numbering
            L(in,ir) = alpha/dx^2;% coefficient of left term
        else
            % when at boundary contribution no contribution to matrix L
            BC(in) = BC(in) + (alpha/dx^2)*BCf(xg(j-1),yg(k));
        end
        
        if j<Nx-1 % does not have any BC to the right
            ir = nn(j+1,k,Nx);
            L(in,ir) = alpha/dx^2;
        else
            % when at boundary contribution no contribution to matrix L
            BC(in) = BC(in) + (alpha/dx^2)*BCf(xg(j+1),yg(k));
        end 
        
        if k>2 %does not have any BC to the bottom
            ir = nn(j,k-1,Nx);
            L(in,ir) = alpha/dy^2;
        else
            % when at boundary contribution no contribution to matrix L
            BC(in) = BC(in) + (alpha/dy^2)*BCf(xg(j),yg(k-1)) ;          
        end
        
        if k<Ny-1 %does not have any BC to the top
            ir = nn(j,k+1,Nx);
            L(in,ir) = alpha/dy^2;
        else
            % when at boundary contribution no contribution to matrix L
            BC(in) = BC(in) + (alpha/dx^2)*BCf(xg(j),yg(k+1));
        end 
    end
end