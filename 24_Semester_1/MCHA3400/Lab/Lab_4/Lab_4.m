clc; clear; close all;

%% Define Parameters
p.r = 0.3;
p.m = 6;
p.c = 2.6e-2;
p.b = 36.7;
p.J = 2.6;
p.g = 9.8;

p.kp = 200;
p.kd = 10;
p.qs = 0.5;

%% define state equations

dL = @(L, q, T_in) (1 + p.m* p.r^2 / p.J) \(-p.r * q / p.c - p.b * p.r^2 * L / p.J + T_in + p.r * p.m * p.g );
dq = @(L) L * p.r / L;

%% ODE Equations
T_in(1,1,1, p)
sys_ode = @(x, u) [dL(x(1), x(2), u); dq(x(1))];

%Define simulation
t_sim = [0 20];

% Define input
V_in = 1;
% Define initial condition
x0 = [0; 0];
keyboard
% ODE wrapper
ode_wrap = @(t, x) sys_ode(x, T_in(t, x(1), x(2), p));
%ode_wrap = @(t, x) sys_ode(x, V_in);

[t,x] = ode45(ode_wrap, t_sim, x0, odeset('RelTol',1e-6));

%% Plot
figure;
subplot(2,1,1);
plot(t, x(:,1), 'LineWidth', 2, 'Color', 'r');
xlabel('Time (s)');
grid on;
legend("I_\lambda");

subplot(2,1,2);
plot(t, x(:,2), 'LineWidth', 2, 'Color', 'r');
xlabel('Time (s)');
grid on;
legend("q");

function Tin = T_in(t, L, q, p)
omega = L / p.J;
if t < 10
  Tin = 0;
elseif t >= 10
  Tin = -p.kp * (q - p.qs) - p.kd * omega;
end
end
