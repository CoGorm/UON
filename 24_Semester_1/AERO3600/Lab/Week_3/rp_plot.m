function rp_plot(sim_nl, sim_lin, rp_title)

nl_t = sim_nl.t;
nl_x1 = sim_nl.x(:,1);
nl_x2 = sim_nl.x(:,2);
nl_x3 = sim_nl.x(:,3);
nl_x4 = sim_nl.x(:,4);
nl_xh1 = sim_nl.xhat(:,1);
nl_xh2 = sim_nl.xhat(:,2);
nl_xh3 = sim_nl.xhat(:,3);
nl_xh4 = sim_nl.xhat(:,4);
nl_u = sim_nl.u;


lin_t = sim_lin.t;
lin_x1 = sim_lin.x(:,1);
lin_x2 = sim_lin.x(:,2);
lin_x3 = sim_lin.x(:,3);
lin_x4 = sim_lin.x(:,4);
lin_xh1 = sim_lin.xhat(:,1);
lin_xh2 = sim_lin.xhat(:,2);
lin_xh3 = sim_lin.xhat(:,3);
lin_xh4 = sim_lin.xhat(:,4);
lin_u = sim_lin.u;

%% Create the figure
figure;
%% Subplot 1
subplot(5, 1, 1);
plot(nl_t, nl_x1*180/pi, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(nl_t, nl_xh1*180/pi, 'LineWidth', 2, 'LineWidth', 2, 'LineStyle', '-.', 'Color', 'black');
hold on;
plot(lin_t, lin_x1*180/pi, 'LineWidth', 2, 'LineStyle', '--', 'Color', 'r');
hold on;
plot(lin_t, lin_xh1*180/pi, 'LineWidth', 2, 'LineStyle', ':', 'Color', 'g');

%x_min = min(sim_nl.x(:,1)*180/pi);
%x_max = max(sim_nl.x(:,1)*180/pi);
%ylim([1.1 * x_min, 1.1 * x_max]);

title(rp_title);
grid;
xlabel('Time [s]');
ylabel('Arm angle [deg]');
leg = legend({'$x_1$ NL Sys';'$\hat{x_1}$ NL Sys';'$x_1$ Lin Sys';'$\hat{x_1}$ Lin Sys'});
set(leg,'Interpreter','latex','FontSize', 12');

%% Subplot 2
subplot(5, 1, 2);
plot(nl_t, nl_x2*180/pi, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(nl_t, nl_xh2*180/pi, 'LineWidth', 2, 'LineWidth', 2, 'LineStyle', '-.', 'Color', 'black');
hold on;
plot(lin_t, lin_x2*180/pi, 'LineWidth', 2, 'LineStyle', '--', 'Color', 'r');
hold on;
plot(lin_t, lin_xh2*180/pi, 'LineWidth', 2, 'LineStyle', ':', 'Color', 'g');

%x_min = min(sim_nl.x(:,2)*180/pi);
%x_max = max(sim_nl.x(:,2)*180/pi);
%ylim([1.1 * x_min, 1.1 * x_max]);

grid;
xlabel('Time [s]');
ylabel('Pendulum angle [deg]');
leg = legend({'$x_2$ NL Sys';'$\hat{x_2}$ NL Sys';'$x_2$ Lin Sys';'$\hat{x_2}$ Lin Sys'});
set(leg,'Interpreter','latex','FontSize', 12');

% Subplot 3
subplot(5, 1, 3);
plot(nl_t, nl_x3*180/pi, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(nl_t, nl_xh3*180/pi, 'LineWidth', 2, 'LineWidth', 2, 'LineStyle', '-.', 'Color', 'black');
hold on;
plot(lin_t, lin_x3*180/pi, 'LineWidth', 2, 'LineStyle', '--', 'Color', 'r');
hold on;
plot(lin_t, lin_xh3*180/pi, 'LineWidth', 2, 'LineStyle', ':', 'Color', 'g');


%x_min = min(sim_nl.x(:,3)*180/pi);
%x_max = max(sim_nl.x(:,3)*180/pi);
%ylim([1.1 * x_min, 1.1 * x_max]);

grid;
xlabel('Time [s]');
ylabel('Arm rate [deg/s]');

leg = legend({'$x_3$ NL Sys';'$\hat{x_3}$ NL Sys';'$x_3$ Lin Sys';'$\hat{x_3}$ Lin Sys'});
set(leg,'Interpreter','latex','FontSize', 12');
% Subplot 4
subplot(5, 1, 4);
plot(nl_t, nl_x4*180/pi, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(nl_t, nl_xh4*180/pi, 'LineWidth', 2, 'LineWidth', 2, 'LineStyle', '-.', 'Color', 'black');
hold on;
plot(lin_t, lin_x4*180/pi, 'LineWidth', 2, 'LineStyle', '--', 'Color', 'r');
hold on;
plot(lin_t, lin_xh4*180/pi, 'LineWidth', 2, 'LineStyle', ':', 'Color', 'g');

%x_min = min(sim_nl.x(:,4)*180/pi);
%x_max = max(sim_nl.x(:,4)*180/pi);
%ylim([1.1 * x_min, 1.1 * x_max]);

grid;
xlabel('Time [s]');
ylabel('Pendulum rate [deg/s]');
leg = legend({'$x_4$ NL Sys';'$\hat{x_4}$ NL Sys';'$x_4$ Lin Sys';'$\hat{x_4}$ Lin Sys'});
set(leg,'Interpreter','latex','FontSize', 12');

% Subplot 5
subplot(5, 1, 5);
plot(sim_nl.t, sim_nl.u, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(sim_lin.t, sim_lin.u, 'LineWidth', 2, 'LineStyle', '--', 'Color', 'r');

%x_min = min(sim_nl.u) - 1;
%x_max = max(sim_nl.u) + 1;
%ylim([1.1 * x_min, 1.1 * x_max]);

grid;
xlabel('Time [s]');
ylabel('Input voltage [v]');
leg = legend({'$V_m$ NL Sys';'$V_m$ Lin Sys'});
set(leg,'Interpreter','latex','FontSize', 12');

end
