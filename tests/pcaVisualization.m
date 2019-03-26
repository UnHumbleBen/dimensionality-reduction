%%Initialization
clear; close all; clc;

%%Import K means sources
addpath("../../image-compression/src");
%%Import PCA sources
addpath("../src");

%%Read image
A = double(imread('../images/bird_small.png'));

%%Constructing data matrix from image
A = A / 255;
[h w n] = size(A);
X = reshape(A, h * w, n);

%%Running K means 
K = 16;
max_iters = 10;
initial_centroids = kMeansInitCentroids(X, K);
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

%%Sample 1000 random indexes (sel is a 1000 by 1 vector filled with random indices)
sel = floor(rand(1000, 1) * size(X, 1)) + 1;

%Setup Color Palette
% hsv returns a colormap that ranges from 0 to K
pallete = hsv(K);
% colors is a 1000 by 1 matrix consisting of the colors assigned by their idx
colors = pallete(idx(sel), :);

%Visualize the data and centroid memberships in 3D
figure;
%% graphs the random 1000 indices in sel into a 
%% 3D plot, "10" indicates the size of the markers
%% colors determines the colors of the data points
scatter3(X(sel, 1), X(sel, 2), X(sel, 3), 10, colors);
title("Pixel dataset plotted in 3D. Color shows centroid memberships");

% save figure
% print -djpg ../figures/figure7.jpg

%%Now, apply PCA to reduce the data
% normalize
[X_norm, mu, sigma] = featureNormalize(X);

% run pca
[U, S] = pca(X_norm);

% get new dataset Z to 2D
Z = projectData(X_norm, U, 2);

% create a 2D figure
figure;
scatter(Z(sel, 1), Z(sel, 2), 10, colors);
title("Pixel dataset plotted in 2D, using PCA for dimensionality reduction");

% save figure
% print -djpg ../figures/figure8.jpg
