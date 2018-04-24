%% Plot the centers and their diam/4 balls just to see how it looks
%% Author: Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems
clear all
close all
clc

% load('../Datasets/twelveclustersgaussian2D.mat')
% X = table2array(clustersgaussian2D);
load('../Datasets/moon.mat')
X = moon;
D = squareform(pdist(X));
min_dist = min(min(D));
max_dist = max(max(D));

radii = min_dist + (1:1:100)*(max_dist - min_dist)/100;

diam = mean(squareform(D));
gamma1 = 2;
gamma2 = 1/16;

delta_hat = 1/2;

[centers, chis, all_growth_rates,labels,padding_parameters,growth_rate_thresholds]  = create_probabilistic_partition_D(X,D,diam,delta_hat,gamma1,gamma2);

%% Some observations made: 
% The center of the cluster doesnt necessarily have to belong to that
% cluster. Also, some clusters may be completely empty. 

%%
% Implementation of concepts from 
%Ittai Abraham, Yair Bartal, Ofer Neiman, Advances in metric embedding theory, ...
%Advances in Mathematics, Volume 228, Issue 6, 2011, Pages 3026-3126,

