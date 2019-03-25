%% Initialization
clear; close all; clc

%% Loading and Visualizing Face Data
fprintf("\nLoading facedataset.\n\n");

% Load Face dataset
load("../data/faces.mat");

% Display the first 100 faces in the dataset
% displayData(X(1:100, :));