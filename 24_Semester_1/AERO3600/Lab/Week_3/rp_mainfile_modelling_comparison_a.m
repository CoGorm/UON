%%% Name: Cody Gorman
%%% Student Number c3378568

close all
clear all
clc

%% Nolinear and linear model parameters

rp_p = rp_parameters();

%% Simulation parameters

rp_p.xbar = rp_p.xbara;
rp_p.ubar = rp_p.ubara;
rp_p.ybar = rp_p.ybara;

rp_p.A = rp_p.Aa;
rp_p.B = rp_p.Ba;
rp_p.C = rp_p.Ca;


%% sfc design
[rp_p.C0check, rp_p.K] = rp_sfc_design(rp_p.A, rp_p.B, rp_p.Ec);

%% obc design
[rp_p.OBcheck, rp_p.L] = rp_obs_design(rp_p.A, rp_p.C, rp_p.Eo);

%%
rp_p.ic = [60 * pi / 180; 60 * pi / 180; 0; 0];
rp_p.iclin = rp_p.ic - rp_p.xbar;
rp_p.icobs = [0;0;0;0];
rp_p.simtime = 3;
%rp_p.simtimelin = 10;

%% Simulation nonlinear model

%sim_nl = sim('rp_ofc_nl');
sim_nl.t = 0;
sim_nl.x(:,1) = 0; 
sim_nl.x(:,2) = 0;
sim_nl.x(:,3)= 0;
sim_nl.x(:,4)= 0;
sim_nl.xhat(:,1)= 0;
sim_nl.xhat(:,2)= 0;
sim_nl.xhat(:,3)= 0;
sim_nl.xhat(:,4)= 0;
sim_nl.u= 0;
%% Simulation linear model

sim_lin = sim('rp_ofc_lin');


%% Plot

rp_title = 'Time histories of the states using the nonlinear model and linearised model about EPa';
rp_plot(sim_nl, sim_lin, rp_title)

%rp_animation(sim_nl.t, sim_nl.x(:, 1), sim_nl.x(:, 2))
