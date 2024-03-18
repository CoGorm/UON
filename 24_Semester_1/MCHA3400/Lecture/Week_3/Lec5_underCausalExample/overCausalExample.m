clear
clc

%% Define parameters

p.J1 = 1;
p.J2 = 1;
p.r1 = 1;
p.r2 = 1;
p.b = 1;

%% Define State Equations

dL1 = @(tau, L1) (1 + (p.J2 * p.r1^2)/(p.J1 * p.r2^2)) \ (tau - (p.b * p.r1^2 * L1)/(p.J1 * p.r2^2));

%% Simulate system

% Define input
tau = @(t) sin(5*t);

% Define initial condition
x0 = 0;

%Define simulation
t_sim = [0 5];

% Solve system ---- x = L1, u = tau
ode_wrap = @(t,x) dL1(tau(t), x);
[res.t, res.x] = ode45(ode_wrap, t_sim, x0);

%% Plot

plot(res.t, res.x)
grid;
legend("L_1")
