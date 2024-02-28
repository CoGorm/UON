%%% Name: Cody Gorman
%%% Student Number: c3378568

function dx=rp_nl_model(in, p)

%% Model input and state variables

vm = in(1);
x1 = in(2);
x2 = in(3);
x3 = in(4);
x4 = in(5);

%% Dynamics equations

Delta = (4 * p.Jp + p.Lp^2 * p.mp) * (4 * p.Jr + p.mp * (p.Lp^2 + 4 * Lr^2)) - p.Lp^2 * p.mp * cos(x2)^2 * (4 * p.Jp + p.mp * (p.Lp^2 + 4 * p.Lr^2));

dx1 = x3;

dx2 = x4;

dx3 = (p.Lp*p.mp*sin(x2)/Delta) * (-2 * x3^2 * p.Lp^2 * p.Lr * p.Lr * p.mp * cos(x2)^2 - 2 * x3 * x4 * p.Lp * cos(x2) * (4 * p.Jp + p.Lp^2 * p.mp) + 2 * x4^2 * p.Lr * (4 * p.Jp + p.Lp^2 * p.mp) + 4 * p.g * p.Lp * p.Lr * p.mp * cos(x2))  - 
