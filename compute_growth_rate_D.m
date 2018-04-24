%% Author:Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems

%% Compute growth rate
%Given a metric space(X,d), radius r and scales gamma1 and gamma2, the
%local growth rate at any point x, rho(x,r,gamma1,gamma2), is given by the number of points in the
%ball centered at x and radius r*gamma1 divided by the number of points in the
%ball centered at x and radius r*gamma2.

%% This implementation uses the distance matrix as opposed to the data matrix. 
% For the implementation that uses the data matrix refer to
% compute_growth_rate.m
function local_growth_rate = compute_growth_rate_D(idx,D,r,gamma1,gamma2)
% D - distance matrix.
% idx - index of the point of concern
% r - radius
% gamma1 and gamma2 - scales
    if nargin < 5
        fprintf('Only received %d arguments. The function compute_growth_rate requires 6 inputs'...
        , length(nargin))
    end
    distances_from_x = D(idx,:);
    no_points_in_larger_ball = sum(distances_from_x < r*gamma1);
    no_points_in_smaller_ball = sum(distances_from_x < r*gamma2);
    
    local_growth_rate = no_points_in_larger_ball/no_points_in_smaller_ball;

end

% Implementation of concepts from 
%Ittai Abraham, Yair Bartal, Ofer Neiman, Advances in metric embedding theory, ...
%Advances in Mathematics, Volume 228, Issue 6, 2011, Pages 3026-3126,
