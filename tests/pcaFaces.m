%% Initialization
clear; close all; clc

addpath("../src");

%% Loading and Visualizing Face Data
fprintf("\nLoading facedataset.\n\n");

% Load Face dataset
load("../data/faces.mat");

% Display the first 100 faces in the dataset
displayData(X(1:100, :));

% print -djpg ../figures/figure4.jpg

%% PCA on Face Data
fprintf(["\nRunning PCA on face dataset.\n" ...
        "(this might take a minute or two ...)\n\n"]);

% Normalize X
[X_norm, mu, sigma] = featureNormalize(X);

% run PCA
[U, S] = pca(X_norm);

%   Display the top 36 eigenvectors found
displayData(U(:, 1:36)');

% print -djpg ../figures/figure5.jpg

%% Dimension Reduction for Faces
fprintf("\nDimension reduction for face dataset.\n\n");

K = 100;
Z = projectData(X_norm, U, K);

fprintf("The projected data Z has a size of: ");
fprintf("%d by %d \n", size(Z));

%% Visualization of Faces after PCA Dimension

fprintf("\nVisualizing the projected faces.\n\n");

K = 100;
X_rec = recoverData(Z, U, K);

% Display normalized data
% plot on a 1 by 2 subwindow in index 1
subplot(1, 2, 1);
% plot the first 100 faces
displayData(X_norm(1:100, :));
title("Original faces");
axis("square");

% plot on a 1 by 2 subwindow in index 2
subplot(1, 2, 2);
% plot the first 100 faces
displayData(X_rec(1:100, :));
title("Recovered faces");
axis("square");

% print -djpg ../figures/figure6.jpg