function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S

% Stores m, number of training examples
% and n, the number of features (dimensions)
[m, n] = size(X);

% Compute covariance matrix
Sigma = (1/m)* X' * X;
[U, S, ~] = svd(Sigma);

end