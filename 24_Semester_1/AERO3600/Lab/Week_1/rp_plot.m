function rp_plot(sim_nl, sim_lin, rp_title)
tiledlayout(5,1);
title(rp_title)
nexttile;
plot(sim_nl.t)

nexttile;
plot(sim_nl.t)

nexttile;
plot(sim_nl.t)

nexttile;
plot(sim_nl.t)

nexttile;
plot(sim_nl.t, sim_nl.u);
end