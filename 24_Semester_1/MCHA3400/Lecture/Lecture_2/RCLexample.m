clear
clc

%% Params
p.C1 = 1;
p.L1 = 1;
p.R1 = 1;

%% state-space equations
dq = @(V_in, q1, lambda1) (V_in / p.R1)- (q1 / (p.R1 * p.C1))-( lambda1 /p.L1);
dlamdba = @(q1) q1 / p.C1;

%% ODE x = [q1; lambda1] u = V_in
sys_ode = @(x,u) [dq(u, x(1), x(2)); dlamdba(x(1))];

%% Solve ODE
t_sim = 0:0.1:10;
x0 = [0;0];
V_in = 1;

%% Create wrapper function
ode_wrap = @(t,x) sys_ode(x, V_in);

[res.t, res.x] = ode45(ode_wrap,t_sim, x0);

plot(res.t, res.x)