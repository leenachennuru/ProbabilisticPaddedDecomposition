%% Author:Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems

%% Compute growth rate
%Given a metric space(X,d), radius r and scales gamma1 and gamma2, the
%local growth rate at any point x, rho(x,r,gamma1,gamma2), is given by the number of points in the
%ball centered at x and radius r*gamma1 divided by the number of points in the
%ball centered at x and radius r*gamma2.

%% This implementation uses the data matrix as opposed to the distance matrix. 
% For the implementation that uses the distance matrix refer to
% compute_growth_rate_D.m
 
function local_growth_rate = compute_growth_rate(x,X,dist,r,gamma1,gamma2)
% X - matrix of points.
% x - point of concern
% dist - type of distance - 'Euclidean','minkowski','cityblock', etc
% r - radius
% gamma1 and gamma2 - scales
    if nargin < 6
        fprintf('Only received %d arguments. The function compute_growth_rate requires 6 inputs'...
        , length(nargin))
    end
    distances_from_x = pdist2(x,X,dist);
    points_in_larger_ball = X((distances_from_x < r*gamma1),:);
    points_in_smaller_ball = X((distances_from_x < r*gamma2),:);
    
    local_growth_rate = size(points_in_larger_ball,1)/size(points_in_smaller_ball,1);

end

% Implementation of concepts from 
%Ittai Abraham, Yair Bartal, Ofer Neiman, Advances in metric embedding theory, ...
%Advances in Mathematics, Volume 228, Issue 6, 2011, Pages 3026-3126,
