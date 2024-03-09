clear
clc

%% System Parameters Structure
p.R1 = 120; % ohms
p.L1 = 100e-6; % henries
p.C1 = 47e-6; % farads
p.R2 = 100; % ohms
p.L2 = 10e-6; % henrys
p.R3 = 330; % ohms

%% CCRs
p.v_R = @(i) i * p.R1;
% Inductor
p.v_L = @(di_dt) p.L1 * di_dt;
% Capacitor
p.i_C = @(dq_dt) dq_dt * p.C1;

% Inductor current dynamics
p.dlambda1_dt = @(lambda1, iL2, Vs) (p.v_R(iL2) - p.v_L(lambda1)) / p.L1 + Vs / p.L1;
p.dlambda2_dt = @(lambda2, iL1) (p.v_R(iL1) - p.v_L(lambda2)) / p.L2;

% Capacitor voltage dynamics
p.dq_dt = @(iL1, iL2) iL1 - iL2;

%% Combined State Equation
p.f = @(t, x, u) [p.dlambda1_dt(x(1), x(2), u); ...
                   p.dlambda2_dt(x(2), x(1)); ...
                   p.dq_dt(x(3), x(1))];

%% Simulation Parameters
t_span = 0:0.001:0.5;
u = 10;
x0 = [0; 0; 0];

%% Simulation using ode23s
% The `keyboard` statement is for debugging purposes and can be removed
% keyboard;  % Uncomment for debugging (optional)
[t, x] = ode23s(p.f, t_span, x0, odeset('RelTol',1e-6));

%% Results and Plotting
% Inductor currents
iL1 = x(:,3);
iL2 = -x(:,2);

% Capacitor voltage
vC = x(:,1) / p.C1;

figure(1);
subplot(3,1,1);
plot(t, iL1);
xlabel('Time (s)');
ylabel('Current through L1 (A)');
grid on;

subplot(3,1,2);
plot(t, iL2);
xlabel('Time (s)');
ylabel('Current through L2 (A)');
grid on;

subplot(3,1,3);
plot(t, vC);
xlabel('Time (s)');
ylabel('Voltage across C1 (V)');
grid on;

sgtitle('Electrical Network Simulation Results');
