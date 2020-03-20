function u = PDE_RKutta4(fun, u0, t0, t1, n)
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
    u = zeros(1, n + 1);
    h = (t1 - t0)/n;
    u(1) = u0;
    for i=1:n
        k1 = h*fun(t(i), u(i));
        k2 = h*fun(t(i) + h/2, u(i) + k1/2);
        k3 = h*fun(t(i) + h/2, u(i) + k2/2);
        k4 = h*fun(t(i) + h, u(i) + k3);
        u(i+1) = u(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
    end
end

