%% Author:Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems

function all_growth_rates = compute_all_growth_rates(D,diam,gamma1,gamma2)
%% Compute the growth rate of all points in the domain
% D - Distance matrix of the data
% diam - scale at which the probabilistic partition is created/radius at which the growth rate is computed
% gamma1 and gamma2 - scales at which the growth rate is computed.
    N = size(D,1);
    all_growth_rates = zeros(N,1);
    for i = 1:N
        all_growth_rates(i) = compute_growth_rate_D(i,D,diam,gamma1,gamma2);
    end
end
% Implementation of concepts from 
%Ittai Abraham, Yair Bartal, Ofer Neiman, Advances in metric embedding theory, ...
%Advances in Mathematics, Volume 228, Issue 6, 2011, Pages 3026-3126,
