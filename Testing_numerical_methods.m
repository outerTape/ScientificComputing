%% Testing the explicit Euler method and a forth order Runge-Kutta method
% Test equation: u'(t) + 4u(t) = 0
% Initial condition: u(0) = 1
% Time frame: t0 = 0, t1 = 3
% Discretization steps: n = 24

fun = @(t,u) -4*u;
u0 = 1; t0 = 1; t1 = 3;
n = 24;

u_EulerExp = PDE_EulerExp(fun, u0, t0, t1, n);
u_RKutta4  = PDE_RKutta4(fun, u0, t0, t1, n);

t = linspace(t0, t1, n + 1);
plot(t, u_EulerExp, t, u_RKutta4);
legend({'Explicit Euler', '4th order Runge-Kutta'}, 'Location' ,'northeast');
xlabel('t');
ylabel('u(t)');