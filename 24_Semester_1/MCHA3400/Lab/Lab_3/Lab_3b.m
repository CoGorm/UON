clear
clc

%% Define parameters

p.L = 10.5e-3;
p.R = 12.8e3;
p.b = 0.042;
p.c = 0.227;
p.KT = 2.64;

%% define state equations

fv = @(i_in, lambda, q) ((p.r)/(p.kt^2 + p.b * p.r)) * (p.kt * i_in - p.kt * lambda / p.l - q / p.c)

dlambda = @(i_in, lambda, q) p.kt * fv(i_in, lambda, q)
dq = @(i_in, lambda, q) fv(i_in, lambda, q)

%% ODE Equations

sys_ode = @(x, u) [dlambda(u, x(1), x(2)); dq(u, x(1), x(2))];

%% Simulate system

%Define simulation
t_sim = [0 0.01];

% Define input
I_in = @(t) 0.1 * sin(1000*t);

% Define initial condition
x0 = [0; 1];

% ODE wrapper
ode_wrap = @(t, x) sys_ode(x, I_in(t));

[t,x] = ode45(ode_wrap, t_sim, x0, odeset('RelTol',1e-6));

%% Plot
figure;
subplot(2,1,1);
plot(t, x(:,1)/p.L, 'LineWidth', 2, 'Color', 'r');
xlabel('Time (s)');
grid on;
legend("I_\lambda");

subplot(2,1,2);
plot(t, x(:,2), 'LineWidth', 2, 'Color', 'r');
xlabel('Time (s)');
grid on;
legend("q");
