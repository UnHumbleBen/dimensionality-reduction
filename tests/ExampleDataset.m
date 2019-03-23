%% Initialization
clear ; close all; clc

fprintf('Visualizing example dataset for PCA.\n\n');

%% Loads Example Dataset 1 and stores it as X
load('../data/example-dataset1.mat');

%% Visualize the example dataset
% @param X(:, 1), the vector to plot against below
% @param X(:, 2), the vector to plot against above
% @param 'bo'   , format argument, where 'b' specifies
%                 blue and 'o' specifies circles
plot(X(:, 1), X(:, 2), 'bo');