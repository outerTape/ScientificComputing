function u_step = time_step(fun, u, t, h, method)
    if method == "EulerExp"
        u_step = h*fun(t, u);
    elseif method == "RKutta4"
        k1 = h*fun(t, u);
        k2 = h*fun(t + h/2, u + k1/2);
        k3 = h*fun(t + h/2, u + k2/2);
        k4 = h*fun(t + h, u + k3);
        u_step = (k1 + 2*k2 + 2*k3 + k4)/6;    
    end
end