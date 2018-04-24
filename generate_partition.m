function [labels,padding_parameters,growth_rate_thresholds] = generate_partition(X,D,diam,centers,chis,delta_hat,all_growth_rates)
    %% Author: Leena Chennuru Vankadara
    % Theory of Machine learning group, 
    % Max Plank Institute for Intelligent Systems
    W = X;
    labels = zeros(size(X,1),1);
    padding_parameters = zeros(size(X,1),1);
    growth_rate_thresholds = zeros(size(X,1),1);
    figure(2)
    scatter(X(:,1),X(:,2))
    hold on;
    for i = 1:length(chis)
            [~,~,idx] = intersect(centers(i,:),W,'rows');
            if ~(isempty(idx))
                r = radii_sampled_exponential(chis(i),diam,1);
                th = 0:pi/50:2*pi;
                xunit = r * cos(th) + W(idx,1);
                yunit = r * sin(th) + W(idx,2);
                plot(xunit, yunit);
                hold on
                points_in_ball = W((D(idx,:) < r),:);
                [~,~,idx_X] = intersect(points_in_ball,X,'rows');
                [~,~,idx_X_center] = intersect(centers(i,:),X,'rows');
                labels(idx_X,1) = i;
                padding_parameters(idx_X,1) = 2^(-6)/(max(log(all_growth_rates(idx_X_center)),log(1/delta_hat)));
                if (all_growth_rates(idx_X_center) >= 1/delta_hat)
                    growth_rate_thresholds(idx_X,1) = 1;
                end
                scatter(points_in_ball(:,1),points_in_ball(:,2),'filled')
                hold on 
                scatter(W(idx,1),W(idx,2),'*')
                drawnow
                pause
                W = W((D(idx,:) >= r),:);
                D = D((D(idx,:) >= r),(D(idx,:) >= r));
            else
                distances_from_v = pdist2(centers(i,:),W);
                r = radii_sampled_exponential(chis(i),diam,1);
                th = 0:pi/50:2*pi;
                xunit = r * cos(th) + centers(i,1);
                yunit = r * sin(th) + centers(i,2);
                plot(xunit, yunit);
                hold on
                points_in_ball = W((distances_from_v < r),:);
                [~,~,idx_X] = intersect(points_in_ball,X,'rows');
                labels(idx_X,1) = i;
                scatter(points_in_ball(:,1),points_in_ball(:,2),'filled')
                hold on 
                scatter(W(idx,1),W(idx,2),'*')
                drawnow
                pause
                W = W((distances_from_v >= r),:);
                D = D((distances_from_v >= r),(distances_from_v >= r));
                
            end
    end
end
% Implementation of concepts from 
%Ittai Abraham, Yair Bartal, Ofer Neiman, Advances in metric embedding theory, ...
%Advances in Mathematics, Volume 228, Issue 6, 2011, Pages 3026-3126,
