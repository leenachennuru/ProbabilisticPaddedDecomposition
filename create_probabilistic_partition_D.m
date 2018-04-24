%% Create probabilistic partition as defined in the uniform padding Lemma[1]
function [centers, chis, all_growth_rates,labels,padding_parameters,growth_rate_thresholds] = create_probabilistic_partition_D(X,D,diam,delta_hat,gamma1,gamma2)
%% Author:Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems
    if ~((0 < delta_hat) && (delta_hat <= 1/2))
        fprintf('delta_hat needs to be greater than 0 and less/equal to 1/2');
    end
    if  ~(gamma1 >= 2)
        fprintf('gamma1 needs to be greater/equal to 2');
    end
     if  ~((0 <= gamma2)  && (gamma2 <= 1/16))
        fprintf('gamma2 needs to be less/equal to 1/16');
     end
    
    all_growth_rates = compute_all_growth_rates(D,2*diam,gamma1,gamma2);
    
    [centers,chis] = generate_centers_PP_D(X,D,delta_hat,diam,all_growth_rates);
    
    [labels,padding_parameters,growth_rate_thresholds] = generate_partition(X,D,diam,centers,chis,delta_hat,all_growth_rates);
    
end

%% Implementation of concepts from
%[1] Ittai Abraham, Yair Bartal, Ofer Neiman, Advances in metric embedding theory, ...
%Advances in Mathematics, Volume 228, Issue 6, 2011, Pages 3026-3126,