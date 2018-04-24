
chi = chis(1);
mu = diam/8*log(chi); 
 tic;
    pd = makedist('Exponential','mu',mu);
    truncated_pd = truncate(pd,diam/4,diam/2);
    sampled_radii = random(truncated_pd,1000,1);
time_a = toc;

tic 

rr = sample(@(x) (chi^(2)/(1 - chi^(-2)))*(1/mu)*exp(-(1/mu)*x), [diam/4 diam/2], 1000);

time_b = toc;

if time_b < time_a
    fprintf('The new code is faster')
else
    fprintf('There is no improvement from the new code')
end