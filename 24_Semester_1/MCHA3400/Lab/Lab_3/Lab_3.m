clear
clc
close all

%% Define Parameters
p.R1 = 120; % ohms
p.R2 = 100; % ohms
p.R3 = 330; % ohms
p.L1 = 100e-6; % henrys
p.L2 = 10e-6; % henrys
p.C1 = 47e-6; % farads

%% Define CCRs

V_R1 = @(I_R1) I_R1 * p.R1;
V_R2 = @(I_R2) I_R2 * p.R2;
V_R3 = @(I_R3) I_R3 * p.R3;
I_L1 = @(lambda1) lambda1 / p.L1;
I_L2 = @(lambda2) lambda2 / p.L2;
V_C1 = @(q) q / p.C1;

%% Define SSRs

I_R1 = @(I_L1) I_L1;
I_in = @(I_L1) I_L1;
V_L1 = @(V_in, V_R1, V_C1, V_R2) V_in - V_R1 - V_C1 - V_R2;
I_C1 = @(I_L1, I_L2) I_L1 - I_L2;
I_R2 = @(I_L1, I_L2) I_L1 - I_L2;
I_R3 = @(I_L2) I_L2;
V_L2 = @(V_C1, V_R2, V_R3) V_C1 + V_R2 - V_R3;

%% Define State Space Equations
% Inductor current dynamics
dlambda1 = @(lambda1, lambda2, q, V_in) V_L1(V_in, V_R1(I_R1(I_L1(lambda1))), V_C1(q), V_R2(I_R2(I_L1(lambda1), I_L2(lambda2))));
dlambda2 = @(lambda1, lambda2, q) V_L2(V_C1(q), V_R2(I_R2(I_L1(lambda1), I_L2(lambda2))), V_R3(I_R3(I_L2(lambda2))));
dq = @(lambda1, lambda2) I_C1(I_L1(lambda1), I_L2(lambda2));


%% Combined State Equation
sys_ode = @(x, u) [dlambda1(x(1), x(2), x(3), u); ...
  dlambda2(x(1), x(2), x(3)); ...
  dq(x(1), x(2))];

%% Simulation Parameters
t_span = [0 0.5];
u = 10;
x0 = [0; 0; 0];

%% Simulation using ode23s
ode_wrap = @(t, x) sys_ode(x, u);

[t, x] = ode23s(ode_wrap, t_span, x0, odeset('RelTol',1e-6));
plotFun(t, x, p);

%% Simulation Parameters
t_span = [0 0.5];

u = @(t) max(min(10 * sin(100 * t), 8), -8);
x0 = [0; 0; 0];

%% Simulation using ode23s
ode_wrap = @(t, x) sys_ode(x, u(t));
[t, x] = ode23s(ode_wrap, t_span, x0, odeset('RelTol',1e-6));
plotFun(t, x, p);

function plotFun(t, x, p)
    figure;
    subplot(2,1,1);
    plot(t, x(:,1)/p.L1, 'LineWidth', 2, 'Color', 'r');
    hold on;
    plot(t, x(:,2)/p.L2, 'LineWidth', 2, 'Color', 'b');
    xlabel('Time (s)');
    ylabel('Current (A)');
    legend(["I_1","I_3"]);
    grid on;

    subplot(2,1,2);
    plot(t, x(:,3)/p.C1, 'LineWidth', 2, 'Color', 'r');
    xlabel('Time (s)');
    ylabel('Voltage (V)');
    grid on;
    legend("V_C1");
end
