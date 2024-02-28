clear all
close all

p = parameters();

p.ic = [10;-1.5];
p.simtime = 1.5;
p.ustep = 0;

simresults = sim('model_example');

