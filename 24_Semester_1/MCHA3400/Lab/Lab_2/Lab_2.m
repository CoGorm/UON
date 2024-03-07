clear
clc

%% Constants
m1 = 600;
m2 = 1200;
b1 = 10;
b2 = 6;
bd = 1400;
c = 9.8e-4;
l0 = 0.8;
B = 5;

%% CCRs
Fs(xs) = 1/c * (xs - l0) + B/xs + B/(2 * l0 - xs);

Fd = @(vd) (bd*vd)*abs(vd);

p1dot = @(Fm1) Fm1;
vm1 = @(m1, p1) (1/m1) * p1;
p2dot = @(Fm2) Fm2;
vm2 = @(m2, p2) (1/m2) * p2;

xsdot2 = @(vs) vs;
Fb1 = @(b1, vb1) b1 * vb1;
Fb2 = @(b2, vb2) b2 * vb2;

%% SSRs
vb2 = @(vm2) vm2;
Fm2 = @(Fd, Fs, Fb2) Fd + Fs - Fb2;
vd = @(vm1, vm2) vm1 - vm2;
vs = @(vm1, vm2) vm1 - vm2;

Fm1 = @(Fd, Fs, Fb1, FT) -Fd - Fs - Fb1 + FT;
vT = @(vm1) vm1;
vb1 = @(vm1) vm1;


