function sampled_radii = radii_sampled_exponential(chi,diam,no_of_radii)
%% Author: Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems
    mu = diam/8*log(chi); 
    pd = makedist('Exponential','mu',mu);
    truncated_pd = truncate(pd,diam/4,diam/2);
    sampled_radii = random(truncated_pd,no_of_radii,1);
%sampled_radii = sample(@(x) (chi^(2)/(1 - chi^(-2)))*(1/mu)*exp(-(1/mu)*x), [diam/4 diam/2], no_of_radii);
end

% Implementation of concepts from 
%Ittai Abraham, Yair Bartal, Ofer Neiman, Advances in metric embedding theory, ...
%Advances in Mathematics, Volume 228, Issue 6, 2011, Pages 3026-3126,


%X = sample(@(x) exp(-x.^2), [-10 10], 100);


    










