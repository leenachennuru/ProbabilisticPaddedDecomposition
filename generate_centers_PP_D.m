function [centers,chis,W,D] = generate_centers_PP_D(X,D,delta_hat,diam,all_growth_rates)
%% Author: Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems
    W = X;
    i = 1;
    figure(22)
    scatter(X(:,1),X(:,2))
    hold on;
    while size(W,1) > 0
        
        % Find the minimum growth rate
        min_growth_rate = min(all_growth_rates);
        % Find all points in W that minimize the growth rate
        min_growth_rate_indicies = (all_growth_rates == min_growth_rate);
        % Pick the first of the point and this becomes the center in this
        % iteration
        v = W(min_growth_rate_indicies,:);
        centers(i,:) = v(1,:);
        scatter(centers(i,1),centers(i,2),'filled')
        drawnow
        pause
        % Set the parameter Chi 
        chis(i) = max(min_growth_rate,2/delta_hat^1/2);
        % Find all points that lie in a ball of radius delta/4 from center
        distances_from_v = D(min_growth_rate_indicies,:);
        distances_from_v = distances_from_v(1,:);
        %points_in_ball = W((distances_from_v < diam/4),:);
        % W = W\B(center,diam/4);
        W = W(~(distances_from_v < diam/4),:);
        % Reset all growth rates of only contain growth rates of points
        % outside the ball
        all_growth_rates = all_growth_rates(~(distances_from_v < diam/4));
        D = D(~(distances_from_v < diam/4),~(distances_from_v < diam/4));
        i = i + 1;
    end 
end
% Implementation of concepts from 
%Ittai Abraham, Yair Bartal, Ofer Neiman, Advances in metric embedding theory, ...
%Advances in Mathematics, Volume 228, Issue 6, 2011, Pages 3026-3126,
