%%% Name: Cody Gorman
%%% Student Number: c3378568

%% a)
x = [1,2,3,4,5];
s = computeAverage(x);
s

%% b)
inputMatrix = [1,2,3;4,5,6];
[meanOut, stdDevOut] = computeStdDev(inputMatrix);
meanOut
stdDevOut

function s = computeAverage(x)
  xbar = mean(x);
  n = length(x)
  sums = 0;
  for i = 1:n
    sums = sums + (x(i) - xbar)^2;
  end
  s = sqrt((sums)/(n - 1));
end

function [meanOut, stdDevOut] = computeStdDev(inputMatrix)
  meanOut = computeStdDev(inputMatrix);
  stdDevOut = std(inputMatrix);
end
