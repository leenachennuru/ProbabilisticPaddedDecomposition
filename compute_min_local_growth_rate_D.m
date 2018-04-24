%% Author:Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems

%% Compute growth rate
%Given a metric space(X,d), radius r, scales gamma1 and gamma2, the
%minimum local growth rate at any point x, rho_hat(x,r,gamma1,gamma2), 
%least growth rate achieved by any point in the ball centered at x and with
%radius r. 

%% This implementation uses the distance matrix as opposed to the data matrix. 
% For the implementation that uses the data matrix refer to
% compute_min_local_growth_rate.m
function min_local_growth_rate = compute_min_local_growth_rate_D(idx,D,r,gamma1,gamma2)
% idx - index of the point of concern
% D - distance matrix in square form
% r - radius
% gamma1 and gamma 2 - scales
    if nargin < 5
        fprintf('Only received %d arguments. The function compute_growth_rate requires 6 inputs'...
        , length(nargin))
    end
    
    distances_from_x = D(idx,:);
    %points_in_ball = X((distances_from_x < r),:);
    indicies_points_in_ball = (distances_from_x < r);
    
    local_growth_rates = zeros(size(indicies_points_in_ball,1),1);

    for i = 1:size(indicies_points_in_ball,1)
        local_growth_rates(i) = compute_growth_rate_D(indicies_points_in_ball(i),D,r,gamma1,gamma2);
    end

    min_local_growth_rate = min(local_growth_rates);
end
% Implementation of concepts from 
%Ittai Abraham, Yair Bartal, Ofer Neiman, Advances in metric embedding theory, ...
%Advances in Mathematics, Volume 228, Issue 6, 2011, Pages 3026-3126,