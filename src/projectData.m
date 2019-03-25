function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting
%only on the top k eigenvectors
%   Z = projectData(X, U, K) computes the projection of
%   the normalized inputs X into the reduced dimensionality
%   space spanned by the first K columns of U. It returns the
%   projected examples in Z.
%

Z = X * U(:, k);

end