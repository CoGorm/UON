function [rp_p] = rp_parameters()

%% Model parameters
rp_p.mr = 0.095;
rp_p.Lr = 0.085;
rp_p.Jr = 1/12 * rp_p.mr * rp_p.Lr^2;

rp_p.mp = 0.024;
rp_p.Lp = 0.129;
rp_p.Jp = 1/12 * rp_p.mp * rp_p.Lp^2;

rp_p.g = 9.81;
rp_p.Rm = 8.4;
rp_p.km = 0.042;

rp_p.Vm = 0;

rp_p.Eca = [-5, -6, -7, -8];
rp_p.Ecb = [-5, -6, -7, -8];

rp_p.Eoa = [-25, -26, -27, -28];
rp_p.Eob = [-30, -31, -32, -33];

%% Linearised model parameters
rp_p.Jt = rp_p.Jr * rp_p.Lp^2 * rp_p.mp + 4 * rp_p.Jp * (rp_p.Jr + rp_p.Lr^2 * rp_p.mp);

rp_p.xbara = [0;
  0;
  0;
  0];

rp_p.xbarb = [0;
  pi;
  0;
  0];

rp_p.ubara = 0;
rp_p.ubarb = 0;

%% A
rp_p.Aa = [0,   0,                                                                                  1,                                                                          0;
  0,   0,                                                                                  0,                                                                          1;
  0,   (rp_p.g * rp_p.Lp^2 * rp_p.Lr * rp_p.mp^2) / (rp_p.Jt),                             - (rp_p.km^2 * (4 * rp_p.Jp + rp_p.Lp^2 * rp_p.mp)) / (rp_p.Jt * rp_p.Rm),  0;
  0,   - (2 * rp_p.g * rp_p.Lp * rp_p.mp * (rp_p.Jr + rp_p.Lr^2 * rp_p.mp)) / (rp_p.Jt),   (2 * rp_p.km^2 * rp_p.Lp * rp_p.Lr * rp_p.mp) / (rp_p.Jt * rp_p.Rm),        0];

rp_p.Ba = [0;
  0;
  (rp_p.km * (4 * rp_p.Jp + rp_p.Lp^2 * rp_p.mp)) / (rp_p.Jt * rp_p.Rm);
  - (2 * rp_p.km * rp_p.Lp * rp_p.Lr * rp_p.mp) / (rp_p.Jt * rp_p.Rm)];

%% B
rp_p.Ab = [0,   0,                                                                                  1,                                                                          0;
  0,   0,                                                                                  0,                                                                          1;
  0,   (rp_p.g * rp_p.Lp^2 * rp_p.Lr * rp_p.mp^2) / (rp_p.Jt),                             - (rp_p.km^2 * (4 * rp_p.Jp + rp_p.Lp^2 * rp_p.mp)) / (rp_p.Jt * rp_p.Rm),  0;
  0,   (2 * rp_p.g * rp_p.Lp * rp_p.mp * (rp_p.Jr + rp_p.Lr^2 * rp_p.mp)) / (rp_p.Jt),     - (2 * rp_p.km^2 * rp_p.Lp * rp_p.Lr * rp_p.mp) / (rp_p.Jt * rp_p.Rm),      0];

rp_p.Bb = [0;
  0;
  (rp_p.km * (4 * rp_p.Jp + rp_p.Lp^2 * rp_p.mp)) / (rp_p.Jt * rp_p.Rm);
  (2 * rp_p.km * rp_p.Lp * rp_p.Lr * rp_p.mp) / (rp_p.Jt * rp_p.Rm)];

%% C
rp_p.Ca = [1, 0, 0, 0;
  0, 1, 0, 0];

rp_p.Cb = [1, 0, 0, 0;
  0, 1, 0, 0];

%% ybar
rp_p.ybara = rp_p.Ca * rp_p.xbara;

rp_p.ybarb = rp_p.Cb * rp_p.xbarb;
end
