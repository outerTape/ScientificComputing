function [u,t] = PDE_Solve(fun, u0, t0, t1, n, method)
% Input arguments:  
%      fun  the name of the right-hand-side EDO function
%      t0   the initial time
%      u0   the initial condition at t0
%      t1   the final time
%      n    the number of time steps between t0 and t1
% Outputs arguments:
%      u    the dimension (n+1) vector containing the numerical
%               solution at times t0+i*h, with h=(t1-t0)/n

    t = linspace(t0, t1, n + 1);
    u = zeros(length(u0), n + 1);
    h = (t1 - t0)/n;
    u(:,1) = u0;
    for i=1:n
        u(:,i+1) = u(:,i) + time_step(fun, u(:,i), t(i), h, method);
    end
end
