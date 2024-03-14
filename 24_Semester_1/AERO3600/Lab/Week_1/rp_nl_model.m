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

Delta = (4 * p.Jp + p.Lp^2 * p.mp) * (4 * p.Jr + p.mp * (p.Lp^2 + 4 * p.Lr^2)) ...
        - p.Lp^2 * p.mp * cos(x2)^2 * (4 * p.Jp + p.mp * (p.Lp^2 + 4 * p.Lr^2));

dx1 = x3;

dx2 = x4;

dx3 = p.Lp * p.mp / Delta * sin(x2) * (-2 * x3^2 * p.Lp^2 * p.Lr * p.mp * cos(x2)^2 ...
      - 2 * x3 * x4 * p.Lp * cos(x2) * (4 * p.Jp + p.Lp^2 * p.mp) ...
      + 2 * x4^2 * p.Lr * (4 * p.Jp + p.Lp^2 * p.mp) ...
      + 4 * p.g * p.Lp * p.Lr * p.mp * cos(x2)) ... 
      - 4 * p.km^2 / (p.Rm * Delta) * (4 * p.Jp + p.Lp^2 * p.mp) * x3 ...
      + 4 * p.km / (p.Rm * Delta) * (4 * p.Jp + p.Lp^2 * p.mp) * vm;

dx4 = (p.Lp * p.mp * sin(x2) / Delta) * (p.Lp * cos(x2) * (x3^2 * (4 * p.Jr + p.Lp^2 * p.mp + 4 * p.Lr^2 * p.mp) ...
       - 4 * x4^2 * p.Lr^2 * p.mp) - x3^2 * p.Lp^3 * p.mp * cos(x2)^3 ...
       + 2 * p.Lp^2 * p.mp * cos(x2)^2 * (2 * x3 * x4 * p.Lr + p.g) ...
       - 2 * p.g * (4 * p.Jr + p.mp * (p.Lp^2 +4 * p.Lr^2 ))) ...
       + 8 * p.km^2 * p.Lp * p.Lr * p.mp * cos(x2) * x3 / (p.Rm * Delta) ...
       - 8 * p.km * p.Lp * p.Lr * p.mp * cos(x2) * vm / (p.Rm * Delta);

%% State derivate vector

dx = [dx1;dx2;dx3;dx4];