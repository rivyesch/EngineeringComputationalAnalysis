function [root,iter] = NR_3D(r0,f,g,h, df_dy,df_dz,dg_dx,dg_dz,dh_dx,dh_dy, tol)

% substituting the x,y and z values of the initial guess into the three
% functions f,g and h
f_r = feval(f,r0(1),r0(2),r0(3));
g_r = feval(g,r0(1),r0(2),r0(3));
h_r = feval(h,r0(1),r0(2),r0(3));

% the constant derivatives (components)
dfdx = -1;
dgdy = -1;
dhdz = -1;

% substituting the x,y and z values of the initial guess into the other six
% derivative components. 
dfdy = feval(df_dy,r0(2));
dfdz = feval(df_dz,r0(3));
dgdx = feval(dg_dx,r0(1));
dgdz = feval(dg_dz,r0(3));
dhdx = feval(dh_dx,r0(1));
dhdy = feval(dh_dy,r0(2));

%initialising variables
current_loop = 1 ;

% an arbitrary value is chosen that is large to kickstart the while loop
% below ( so while loop is true and initialised/started )
diff = 10^6 ;

while((abs(diff)>tol))
    
    % finds the new values of x,y and z
    x_new = r0(1) - f_r/dfdx - f_r/dfdy - f_r/dfdz ;
    y_new = r0(2) - g_r/dgdx - g_r/dgdy - g_r/dgdz ;
    z_new = r0(3) - h_r/dhdx - h_r/dhdy - h_r/dhdz ;
    
    % substituting the new x,y and z values just found into the three
    % functions to find it's new values (updated)
    f_r = feval(f,x_new,y_new,z_new);
    g_r = feval(g,x_new,y_new,z_new);
    h_r = feval(h,x_new,y_new,z_new);
    
    % substituting the new x,y and z values just found into the six 
    % derivative components to find the new derivative component values (updated)
    dfdy = feval(df_dy,y_new);
    dfdz = feval(df_dz,z_new);
    dgdx = feval(dg_dx,x_new);
    dgdz = feval(dg_dz,z_new);
    dhdx = feval(dh_dx,x_new);
    dhdy = feval(dh_dy,y_new);
   
    % finding the difference between the new and the previous value of x,
    % The same is done for y and z too.
    diff_x = x_new - r0(1) ;
    diff_y = y_new - r0(2) ;
    diff_z = z_new - r0(3) ;
    
    % the largest difference is taken 
    diff = max([diff_x,diff_y,diff_z]);
    
    % at the end of the loop the values just found are put into the r0
    % variable as for the next iteration it is considered as the old value
    r0 = [x_new, y_new, z_new];
    
    % implementing a way to determine if the root does not exist or does
    % not appear to be converging
    if current_loop >100
        fprintf('Too many iterations executed, hence it is determined that the root cannot be found or simply does not converge')
        break
    end
    
    % counts the number of loops executed 
    current_loop = current_loop + 1;
    
    
    
end

root = r0;

% final count of number of iterations the code performs to find the root
% (-1 because once the root is found and the largest difference is less 
% than the tolerance given line 66 still excutes before the loop ends giving 
% an extra count) 
iter = current_loop - 1;