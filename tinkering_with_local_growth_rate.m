clear all
close all
clc

X = table2array(moon);

D = squareform(pdist(X));
min_dist = min(min(D));
max_dist = max(max(D));

radii = min_dist + (1:1:100)*(max_dist - min_dist)/100;

r = radii(40);
gamma1 = 2;
gamma2 = 1/16;
local_growth_rate_X = zeros(size(X,1),1);
for idx = 1:size(X,1)
local_growth_rate_X(idx)=compute_growth_rate(X(idx,:),X,'Euclidean',r,gamma1,gamma2);
end

local_growth_rate_D = zeros(size(X,1),1);
for idx = 1:size(X,1)
local_growth_rate_D(idx)=compute_growth_rate_D(idx,distanceMatrix,r,gamma1,gamma2);
end

figure(3)
scatter(X(:,1),X(:,2),10,local_growth_rate,'filled');