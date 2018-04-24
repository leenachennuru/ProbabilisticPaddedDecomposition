clear all
close all
clc

load('../Datasets/moon.mat')
X = moon;

D = squareform(pdist(X));
min_dist = min(min(D));
max_dist = max(max(D));

radii = min_dist + (1:1:100)*(max_dist - min_dist)/100;

diam = radii(40);
gamma1 = 2;
gamma2 = 1/16;

delta_hat = 1/2;

[centers, chis, all_growth_rates]  = create_probabilistic_partition_D(X,D,diam,delta_hat,gamma1,gamma2);


