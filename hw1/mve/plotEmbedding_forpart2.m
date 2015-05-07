% Plots a 2d embedding
function plotEmbedding_forpart2(Y, neighbors, plotTitle, figureNum, X, element_dim1, element_dim2,width)
    figure(figureNum);
    clf;
    
    N = length(neighbors);
    
    
    scatter(Y(1,:),Y(2,:), 60,'filled'); axis equal;
    % Offsets of image from associated point
    dx = 0.02;
    dy = 0.02;

%     width = 3000; % 0.1

    height = element_dim1 / element_dim2 * width;

    for i = 1:size(X,2)    
        matrix = zeros(28,28,3);
        reshape_m = reshape(X(:,i),element_dim1,element_dim2);
        reshape_m = rot90(reshape_m,2);
        matrix(:,:,1) = reshape_m;
        matrix(:,:,2) = reshape_m;
        matrix(:,:,3) = reshape_m;
%         plot_decision = rand(1);
%         if plot_decision <= 0.5
            image('CData', 1-matrix,...
                  'XData', [Y(1,i)-dx Y(1,i)-(dx+width)],...
                  'YData', [Y(2,i)-dy Y(2,i)-(dy+height)]);
%         end
    end
    
    for i=1:N
        for j=1:N
            if neighbors(i, j) == 1
                line( [Y(1, i), Y(1, j)], [ Y(2, i), Y(2, j)], 'Color', [0, 0, 1], 'LineWidth', 1);
            end
        end
    end
    

    title(plotTitle);
    drawnow; 
    axis off;
end