function rp_plot(sim_nl, sim_lin, rp_title)

% Create the figure
figure;
% Subplot 1
subplot(5, 1, 1); % 5 rows, 1 column, subplot 1
title(rp_title)
plot(sim_nl.t, sim_nl.x(:,1)*180/pi, 'LineWidth', 2, 'Color', 'b');
hold on;  % Allow plotting multiple lines on same graph
plot(sim_lin.t, sim_lin.x(:,1)*180/pi, 'LineWidth', 2, 'LineStyle', '--', 'Color', 'r');
title(rp_title);
grid;
xlabel('Time [s]');
ylabel('Arm angle [deg]');
legend('x_1 Nonlinear', 'x_1 Linear');  % Add legend for clarity

% Subplot 2 (similar structure for remaining subplots)
subplot(5, 1, 2);
plot(sim_nl.t, sim_nl.x(:,2)*180/pi, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(sim_lin.t, sim_lin.x(:,2)*180/pi, 'LineWidth', 2, 'LineStyle', '--', 'Color', 'r');
grid;
xlabel('Time [s]');
ylabel('Pendulum angle [deg]');
legend('x_2 Nonlinear', 'x_2 Linear');

% Subplot 3
subplot(5, 1, 3);
plot(sim_nl.t, sim_nl.x(:,3)*180/pi, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(sim_lin.t, sim_lin.x(:,3)*180/pi, 'LineWidth', 2, 'LineStyle', '--', 'Color', 'r');
grid;
xlabel('Time [s]');
ylabel('Arm rate [deg/s]');
legend('x_3 Nonlinear', 'x_3 Linear');

% Subplot 4
subplot(5, 1, 4);
plot(sim_nl.t, sim_nl.x(:,4)*180/pi, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(sim_lin.t, sim_lin.x(:,4)*180/pi, 'LineWidth', 2, 'LineStyle', '--', 'Color', 'r');
grid;
xlabel('Time [s]');
ylabel('Pendulum rate [deg/s]');
legend('x_4 Nonlinear', 'x_4 Linear');

% Subplot 5
subplot(5, 1, 5);
plot(sim_nl.t, sim_nl.Vm, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(sim_lin.t, sim_lin.Vm, 'LineWidth', 2, 'LineStyle', '--', 'Color', 'r');
grid;
xlabel('Time [s]');
ylabel('Input voltage [v]');
legend('Vm Nonlinear', 'Vm Linear');

end