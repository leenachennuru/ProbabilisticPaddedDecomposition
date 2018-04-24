%% Author:Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems

%% Compute growth rate
%Given a metric space(X,d), radius r, scales gamma1 and gamma2, the
%minimum local growth rate at any point x, rho_hat(x,r,gamma1,gamma2), 
%least growth rate achieved by any point in the ball centered at x and with
%radius r. 

%% This implementation uses the data matrix as opposed to the distance matrix. 
% For the implementation that uses the distance matrix refer to
% compute_min_local_growth_rate_D.m

function min_local_growth_rate = compute_min_local_growth_rate(x,X,dist,r,gamma1,gamma2)
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
    points_in_ball = X((distances_from_x < r),:);
    
    local_growth_rates = zeros(size(points_in_ball,1),1);

    for i = 1:size(points_in_ball,1)
        local_growth_rates(i) = compute_growth_rate(points_in_ball(i,:),X,dist,r,gamma1,gamma2);
    end

    min_local_growth_rate = min(local_growth_rates);
end


% Implementation of concepts from 
%Ittai Abraham, Yair Bartal, Ofer Neiman, Advances in metric embedding theory, ...
%Advances in Mathematics, Volume 228, Issue 6, 2011, Pages 3026-3126,