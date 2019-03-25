PCA

fprintf('\nDimension reduction on example dataset.\n\n');

%   Plot the normalized dataset (returned from featureNormalize)
plot(X_norm(:, 1), X_norm(:, 2), 'bo');
axis([-4 3 -4 3]); axis square

%   Project the data onto K = 1 dimension
K = 1;
Z = projectData(X_norm, U, K);
fprintf('Projection of the first example: %f\n', Z(1));
fprintf('\n(this value should be about 1.481274)\n\n');

X_rec = recoverData(Z, U, K);
fprintf("Approximation of the first example: %f %f\n", X_rec(1, 1), X_rec(1, 2));
fprintf("\n(this value should be about -1.047419 -1.047419)\n\n");

% Draw lines connecting the projected points
% to the original points
hold on;
% plot recovered points as red circles
plot(X_rec(:, 1), X_rec(:, 2), 'ro');
% draw line from projected to original points
for i = 1:size(X_norm, 1)
    % draw lines from the ith original
    % point to ith recovered point
    % as black dotted lines of with 1
    drawLine(X_norm(i,:), X_rec(i,:), '--k', 'LineWidth', 1);
end
hold off

% script for saving the figure
% print -djpg ../figures/figure3.jpg