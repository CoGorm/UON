clear
clc

%% Params
p.C1 = 1;
p.L1 = 1;
p.R1 = 1;

ccr.V_C1 = @(q1) q1/p.C1;
ccr.I_L1 = @(lambda1) lambda1/p.L1;
ccr.I_R1 = @(V_R1) V_R1/p.R1;

ssr.I_in = @(I_R1) I_R1;
ssr.V_R1 = @(V_in, V_C1) V_in - V_C1;
ssr.I_C1 = @(I_R1, I_L1) I_R1 - I_L1;
ssr.V_L1 = @(V_C1) V_C1;


%% state-space equations
dq = @(V_in, q1, lambda1) ssr.I_C1(ccr.I_R1(ssr.V_R1(V_in, ccr.V_C1(q1))), ccr.I_L1(lambda1));
dlamdba = @(q1) ssr.V_L1(ccr.V_C1(q1));

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