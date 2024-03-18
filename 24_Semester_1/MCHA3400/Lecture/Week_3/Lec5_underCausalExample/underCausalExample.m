clear
clc

%% Define parameters

p.R1 = 1;
p.R2 = 1;
p.C = 1;
p.L = 1;

%% Define CCRs

V_c = @(q) q / p.C;

I_L = @(lambda) lambda / p.L;

e_v = @(V_in, q, lambda) (p.R1*p.R2 / (p.R1 + p.R2)) * (V_in / p.R1 - V_c(q) / p.R1 - I_L(lambda));

I_R1 = @(V_R1) V_R1 / p.R1;

%% Define SSRs

V_R1 = @(V_in, V_c, e_v) V_in - V_c - e_v;

%% Define State Space Equations

dq = @(V_in, q, lambda) I_R1(V_R1(V_in, V_c(q), e_v(V_in, q, lambda)));

dlambda = @(V_in, q, lambda) e_v(V_in, q, lambda);

%% ODE equations

sys_ode = @(x, u) [dq(u, x(1), x(2)); dlambda(u, x(1), x(2))];

%% Simulate the system

% Time
t_sim = [0 5];

% Define input
V_sim = @(t) sin(t);

% Initial Condition
x0 = [0;0];

% ODE wrapper
ode_wrap = @(t, x) sys_ode(x, V_sim(t));

[t,x] = ode45(ode_wrap, t_sim, x0);

%% Plot

plot(t, x)
grid;
legend("q", "\lambda")
