%% Initialization
clear ; close all; clc

addpath("../src");

%% Loads Example Dataset 1 and stores it as X
load('../data/example-dataset1.mat');

fprintf('\nRunning PCA on example dataset.\n\n');

%% normalize X
[X_norm, mu, sigma] = featureNormalize(X);