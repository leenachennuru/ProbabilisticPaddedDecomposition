function [embedding_into_line] = create_embedding_into_line(X,D,eta)
%% Author:Leena Chennuru Vankadara
% Theory of Machine learning group, 
% Max Plank Institute for Intelligent Systems

    delta_hat = 1/2;
    gamma1 = 8/eta;
    gamma2 = 1/16;
    i = 1;
    diam = max(max(D));
    while diam > 0  
        diam = ((eta/8)^(i-1))*diam; 
        delta_sequence(i) = diam; %#ok<*AGROW>
        i = i + 1;
    end
   phi_values = zeros(size(X,1),length(delta_sequence));
   psi_values = zeros(size(X,1),length(delta_sequence));
   for i = 1:(length(delta_sequence)-1)
      fprintf('Value of i is %d \n',i); %For debugging
      [~, ~, ~,labels,padding_parameters,growth_rate_thresholds]  = ...
          create_probabilistic_partition_D(X,D,delta_sequence(i),...
          delta_hat,gamma1,gamma2);
      sigma_values = ones(size(X,1),1);
      unique_labels = unique(labels);
      for k = 1:length(unique(labels))
          sigma_values(labels == unique_labels(k)) = rand(1);
      end
      for j = 1:size(X,1)
          distance_from_v_to_boundary = min(D(j,labels ~= labels(j)));
          phi_values(j,i) = min((growth_rate_thresholds(j)/padding_parameters(j))...
              *distance_from_v_to_boundary,eta*delta_sequence(i)/4);
          psi_values(j,i) = phi_values(j,i)*sigma_values(j);
      end
   end

   embedding_into_line = sum(psi_values,2);
   
end