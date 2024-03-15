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
%rp_p.ybar = rp_p.ybara;

rp_p.A = rp_p.Ab;
rp_p.B = rp_p.Bb;
%rm_p.C = rp_p.Cb;

[rp_p.C0check, rp_p.K] = rp_sfc_design(rp_p.A, rp_p.B, rp_p.Ec);

rp_p.ic = [60 * pi / 180; 160 * pi / 180; 0; 0];

rp_p.iclin = rp_p.ic - rp_p.xbar;

rp_p.simtime = 10;
%%rp_p.simtimelin = 10;

%% Simulation nonlinear model

sim_nl = sim('rp_modelling_nl');

%% Simulation linear model

sim_lin = sim('rp_modelling_lin');


%%

rp_title = 'Time histories of the states using the nonlinear model and linearised model about EPb';
rp_plot(sim_nl, sim_lin, rp_title)

rp_animation(sim_nl.t, sim_nl.x(:, 1), sim_nl.x(:, 2))
