ExampleDataset
addpath("../src");

fprintf('\nRunning PCA on example dataset.\n\n');

%% normalize X
[X_norm, mu, sigma] = featureNormalize(X);

%% Run PCA
[U, S] = pca(X_norm);

%% Draw the eigenvectors centered at mean of
%% dataset. The lines show the directions of
%% maximum variations in the dataset.
hold on;
drawLine(mu, mu + S(1,1) * U(:,1)', '-k', 'LineWidth', 2);
drawLine(mu, mu + S(2,2) * U(:,2)', '-k', 'LineWidth', 2);
hold off;

% print -djpg ../figures/figure2.jpg