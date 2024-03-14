function rp_plot(sim_nl, sim_lin, rp_title)
tiledlayout(5,1);
title(rp_title)
nexttile;
plot(sim_nl.t, sim_nl.x(:,1)*180/pi, sim_lin.t, sim_lin.x(:,1)*180/pi)
nexttile;
plot(sim_nl.t, sim_nl.x(:,2)*180/pi, sim_lin.t, sim_lin.x(:,2)*180/pi)

nexttile;
plot(sim_nl.t, sim_nl.x(:,3)*180/pi, sim_lin.t, sim_lin.x(:,3)*180/pi)

nexttile;
plot(sim_nl.t, sim_nl.x(:,4)*180/pi, sim_lin.t, sim_lin.x(:,4)*180/pi)

nexttile;
plot([1:1:10], [0])
%plot(sim_nl.t, sim_nl.u, sim_lin.t, sim_lin.u)
end