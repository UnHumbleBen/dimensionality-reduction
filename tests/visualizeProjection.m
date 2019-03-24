PCA

fprintf('\nDimension reduction on example dataset.\n\n');

%   Plot the normalized dataset (returned from featureNormalize)
plot(X_norm(:, 1), X_norm(:, 2), 'bo');
axis([-4 3 -4 3]); axis square