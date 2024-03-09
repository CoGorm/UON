clear
clc

%% Parameters Structure
p.m1 = 600;
p.m2 = 1200;
p.b1 = 10;
p.b2 = 6;
p.bd = 1400;
p.c = 9.8e-4;
p.l0 = 0.8;
p.B = 5;
p.t = 0:1:300;
p.t2 = 0:1:600;
p.p10 = 0;
p.p20 = 0;
p.xs0 = 0.8;

%% CCRs (Component Constitutive Relations)
p.Fs = @(xs) 1/p.c * (xs - p.l0) + p.B/xs + p.B/(2 * p.l0 - xs);
p.Fd = @(vd) (p.bd * vd) * abs(vd);

%% SSRs (State-Space Relations)
p.vm1 = @(p1) 1/p.m1 * p1;
p.vm2 = @(p2) 1/p.m2 * p2;
p.vb1 = @(vm1) vm1;
p.vb2 = @(vm2) vm2;
p.vd = @(vm1, vm2) vm1 - vm2;
p.vs = @(vm1, vm2) vm1 - vm2;
p.vT = @(vm1) vm1;

p.Fm1 = @(Fd, Fs, Fb1, FT) - Fd - Fs - Fb1 + FT;
p.Fm2 = @(Fd, Fs, Fb2) Fd + Fs - Fb2;

p.FT = @(vm1) 300 - vm1 * (28/300);

%% State Equations
p.p1dotfun = @(t, p1, p2, xs) p.Fm1(p.Fd(p.vd(p.vm1(p1), p.vm2(p2))), p.Fs(xs), p.b1 * p.vb1(p.vm1(p1)), p.FT(p.vm1(p1)));
p.p2dotfun = @(t, p1, p2, xs) p.Fm2(p.Fd(p.vd(p.vm1(p1), p.vm2(p2))), p.Fs(xs), p.b2 * p.vb2(p.vm2(p2)));
p.xsdotfun = @(t, p1, p2, xs) p.vs(p.vm1(p1), p.vm2(p2));

%% State Vector and Combined State Equation
x = [p.p10; p.p20; p.xs0];
f = @(t, x) [p.p1dotfun(t, x(1), x(2), x(3)); ...
  p.p2dotfun(t, x(1), x(2), x(3)); ...
  p.xsdotfun(t, x(1), x(2), x(3))];

%% Simulation
[t, x] = ode45(f, p.t, x, ...
  odeset('RelTol',1e-6));

%% Plotting Results
figure(1);
tiledlayout(2,1);
nexttile;
plot(t, x(:,1), 'b-', 'LineWidth', 2);
hold on;
plot(t, x(:,2), 'r-', 'LineWidth', 2);
legend('p_1', 'p_2');
grid on;
hold off;
nexttile;
plot(t, x(:,3), 'g-', 'LineWidth', 2);
legend('x_s');
grid on;

%% figure 2
p.FT = @(vm1, t) FT2(vm1, t);

%% State Equations
p.p1dotfun = @(t, p1, p2, xs) p.Fm1(p.Fd(p.vd(p.vm1(p1), p.vm2(p2))), p.Fs(xs), p.b1 * p.vb1(p.vm1(p1)), p.FT(p.vm1(p1),t));
p.p2dotfun = @(t, p1, p2, xs) p.Fm2(p.Fd(p.vd(p.vm1(p1), p.vm2(p2))), p.Fs(xs), p.b2 * p.vb2(p.vm2(p2)));
p.xsdotfun = @(t, p1, p2, xs) p.vs(p.vm1(p1), p.vm2(p2));

%% State Vector and Combined State Equation
x = [p.p10; p.p20; p.xs0];
f = @(t, x) [p.p1dotfun(t, x(1), x(2), x(3)); ...
  p.p2dotfun(t, x(1), x(2), x(3)); ...
  p.xsdotfun(t, x(1), x(2), x(3))];

%% Simulation
[t, x] = ode45(f, p.t2, x, ...
  odeset('RelTol',1e-6));

%% figure 2
figure(2);
tiledlayout(2,1);
nexttile;
plot(t, x(:,1), 'b-', 'LineWidth', 2);
hold on;
plot(t, x(:,2), 'r-', 'LineWidth', 2);
legend('p_1', 'p_2');
grid on;
hold off;
nexttile;
plot(t, x(:,3), 'g-', 'LineWidth', 2);
legend('x_s');
grid on;

function ft = FT2(vm1, t)
if t < 300
  ft = 300 - vm1 * (28/300);
else
  ft = 0;
end
end
