%%% Name: Cody Gorman
%%% Student Number c3378568

close all
clear all
clc

%% Nolinear and linear model parameters

rp_p = rp_parameters();

%% Simulation parameters

rp_p.xbar = rp_p.xbarb;
rp_p.ubar = rp_p.ubarb;
rp_p.ybar = rp_p.ybarb;

rp_p.A = rp_p.Ab;
rp_p.B = rp_p.Bb;
rp_p.C = rp_p.Cb;

rp_p.Ec = rp_p.Ecb;
rp_p.Eo = rp_p.Eob;

%% sfc design
[rp_p.C0check, rp_p.K] = rp_sfc_design(rp_p.A, rp_p.B, rp_p.Ec);

%% obc design
[rp_p.OBcheck, rp_p.L] = rp_obs_design(rp_p.A, rp_p.C, rp_p.Eo);

%%
rp_p.ic = [10 * pi / 180; 160 * pi / 180; 0; 0];
rp_p.iclin = rp_p.ic - rp_p.xbar;
rp_p.icobs = [0;0;0;0];
rp_p.simtime = 3;
%rp_p.simtimelin = 10;

%% Simulation nonlinear model

sim_nl = sim('rp_ofc_nl');

%% Simulation linear model

sim_lin = sim('rp_ofc_lin');

%% Plot

rp_title = 'Time histories of the states using the nonlinear model and linearised model about EPa';
rp_plot(sim_nl, sim_lin, rp_title)

rp_animation(sim_nl.t, sim_nl.x(:, 1), sim_nl.x(:, 2))
