%% Simulating an epidemtic using the SIR model
% S: susceptible 
% I: infected
% R: recovered
% Sytem of equations:
% dS/dt = -beta*I*S
% dI/dt = beta*I*S - gamma*I
% dR/dt = gamma*I
% Initial condtions:
% S_0 = 10000
% I_0 = 1
% R_0 = 0;

t0 = 0; t1 = 30;
X0 = [10000; 1; 0];
beta = 0.05; gamma = 0.3;
fun = @(t, x) [-beta*x(1)*x(2); beta*x(1)*x(2) - gamma*x(2); gamma*x(2)];

n = 250;

[X, t] = PDE_Solve(fun, X0, t0, t1, n, "RKutta4");