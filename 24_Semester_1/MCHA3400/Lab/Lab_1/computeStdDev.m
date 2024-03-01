function [meanOut, stdDevOut] = computeStdDev(inputMatrix)
    meanOut = computeAverage(inputMatrix);
    xbar = meanOut;
    [M, N] = size(inputMatrix);
    sums = 0;
    for i = 1:M
      sums = sums + (sum(inputMatrix(i,:)) - xbar)^2;
    end
    stdDevOut = sqrt((sums)/((M*N) - 1));
end

function avg = computeAverage(x)
    avg = mean(x, 'all');
end