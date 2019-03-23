function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each function is 0 and the standard deviation
%   is 1.

% computes the mean of each column
mu = mean(X);
% Binary FUNction with Singleton eXpansion
% applies element-wise subtraction between X and mu
X_norm = bsxfun(@minus, X, mu);

end