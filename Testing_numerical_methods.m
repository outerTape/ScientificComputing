%% Testing the explicit Euler method and a forth order Runge-Kutta method
% Test equation: u'(t) + 4u(t) = 0
% Initial condition: u(0) = 1
% Solution: u(t) = exp(-4t)
% Time frame: t0 = 0, t1 = 3
% Discretization steps: n = 24

fun = @(t,u) -4*u;
u0 = 1; t0 = 0; t1 = 3;
n = 24;
t = linspace(t0, t1, n + 1);

u_EulerExp = PDE_Solve(fun, u0, t0, t1, n, "EulerExp");
u_RKutta4  = PDE_Solve(fun, u0, t0, t1, n, "RKutta4");
u = exp(-4*t);

plot(t, u_EulerExp,'--*', t, u_RKutta4,'--*', t, u);
legend({'Explicit Euler', '4th order Runge-Kutta', 'Exact solution'}, 'Location' ,'northeast');
xlabel('t');
ylabel('u(t)');

err_EulerExp = max(abs(u - u_EulerExp));
err_RKutta4 = max(abs(u - u_RKutta4));

%% Testing numerical methods in multiple dimensions
% Test equation 1:
% dx_1/dt = -4*x_1
% dx_2/dt = -4*x_2
% Initial condition:
% X = [x_1;x_2] = [1;1]
% Solution:
% x_1(t) = exp(-4*t)
% x_2(t) = exp(-4*t)
% Time frame: t0 = 0, t1 = 3
% Discretization steps: n = 24

fun = @(t,x) [ -4*x(1); -2*x(2)];
X_0 = [1;1]; 
t0 = 0; t1 = 3;
n = 240;

[X_EulerExp, t] = PDE_Solve(fun, X_0, t0, t1, n, "RKutta4");
X = [exp(-4*t);exp(-2*t)];
plot(t, X_EulerExp(2,:), t, X(2,:))
%%
% Test equation 2: 
% dx_1/dt = 4*x_1-3*x_2 + (-4*t^2+5*t)*x_1
% dx_1/dt = 6*x_1-7*x_2 + (-6*t^2+7*t+1)*x_2
% Initial condition:
% X = [x_1;x_2] = [2;-1]
% Solution:
% x_1(t) = 3*exp(2*t)-exp(-5*t)+t^2
% x_2(t) = 2*exp(2*t)-3*exp(-5*t)+t
% Time frame: t0 = 0, t1 = 3
% Discretization steps: n = 24

fun = @(t,x) [ 4*x(1)-3*x(2) + (-4*t^2+5*t)*x(1); ...
               6*x(1)-7*x(2) + (-6*t^2+7*t+1)*x(2)];
X_0 = [2;-1]; 
t0 = 0; t1 = 3;
n = 10000;

[X_EulerExp, t] = PDE_Solve(fun, X_0, t0, t1, n, "RKutta4");
X = [3*exp(2*t)-exp(-5*t)+t.^2;2*exp(2*t)-3*exp(-5*t)+t];

plot(t, X_EulerExp(1,:), t, X(2,:))
