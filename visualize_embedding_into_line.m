%% Visualizing an embedding into the line
%% Author: Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems
clear all
close all
clc
profile on
%% Parameters to be set
eta = 1/8;

%% Dataset 
%  load('../Datasets/twelveclustersgaussian2D.mat')
%  X = table2array(clustersgaussian2D);
load('../Datasets/half_kernel_labelled.mat')
% X = moon;
D = squareform(pdist(X));

%% Create the embedding
[embedding_into_line] = create_embedding_into_line(X,D,eta);

%% Plotting the embedding
figure(1)
scatter3(X(:,1),X(:,2),embedding_into_line)