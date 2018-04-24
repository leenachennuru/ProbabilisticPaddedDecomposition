%% Author:Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems

function all_growth_rates = compute_all_growth_rates(D,diam,gamma1,gamma2)
    N = size(D,1);
    all_growth_rates = zeros(N,1);
    for i = 1:N
        all_growth_rates(i) = compute_growth_rate_D(i,D,diam,gamma1,gamma2);
    end
end