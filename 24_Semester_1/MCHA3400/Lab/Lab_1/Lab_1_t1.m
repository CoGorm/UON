%%% Name: Cody Gorman
%%% Student Number: c3378568

clc;
close all;
clear all;

%% 1a
f = @(x) -abs(x)*x;

f(-4)


%% 1b
%x = [x1;x2];
x = [4;-5];
g(x)

%% 1c
x0 = [2;-5];
tspan = [0 30];

[t,x] = ode45(@dx,tspan,x0);
plot(t,x(:,1),t,x(:,2));
legend('x_1','x_2');

%% 1d

[ut,ux] = ode45(@dux,tspan,x0);
plot(ut,ux(:,1),ut,ux(:,2));
legend('x_1','x_2');

%% 1e

[et,ex] = ode45(@dex,tspan,x0);
plot(et,ex(:,1),et,ex(:,2));
legend('x_1','x_2');


%%% Task 2
%% a)
inputMatrix = [1,2,3;4,5,6];
s = computeAverage(inputMatrix);

%% b)
[meanOut, stdDevOut] = computeStdDev(inputMatrix);

%% c)
A1 = zeros(5,8);
A2 = ones(5,8);
A3 = normrnd(0,1,[500,800]);

[meanOut, stdDevOut] = computeStdDev(A1);
meanOut
stdDevOut
[meanOut, stdDevOut] = computeStdDev(A2);
meanOut
stdDevOut
[meanOut, stdDevOut] = computeStdDev(A3);
meanOut
stdDevOut


%% functions
function gx = g(x)
gx = [-(x(1)^2 + x(2)^2) + x(1)*x(2);
  -abs(x(2))*x(2)];
end

function dx = dx(t, x)
a = 0.2; b=0.8;
dx = [- a * (x(1)^2 + x(2)^2) + x(1)*x(2);
  - b * abs(x(2))*x(2)];
end

function dux = dux(t, x)
u = @(ux,ut) [ux;ut];
u_xt = u(0, 0);
a = 0.2; b=0.8;
dux = [- a * (x(1)^2 + x(2)^2) + x(1)*x(2);
  - b * abs(x(2))*x(2)] + u_xt;
end

function dex = dex(t, x)
u = @(ux,ut) [-x(1)+sin(t);-cos(4*t)];
u_xt = u(0, 0);
a = 0.2; b=0.8;
dex = [- a * (x(1)^2 + x(2)^2) + x(1)*x(2);
  - b * abs(x(2))*x(2)] + u_xt;
end

function avg = computeAverage(x)
avg = mean(x, 'all');
end

function avg = computeAverage2(x)
sumit =0;
[M,N] = size(x);
for i=1:M
  sumit = sumit + sum(x(i,:));
end
avg = sumit/(M*N);
end

function [meanOut, stdDevOut] = computeStdDev(inputMatrix)

meanOut = computeAverage(inputMatrix)
xbar = meanOut;
[M, N] = size(inputMatrix);
sums = 0;
for i = 1:M
  sums = sums + (sum(inputMatrix(i,:)) - xbar)^2;
end
stdDevOut = sqrt((sums)/((M*N) - 1));
end
