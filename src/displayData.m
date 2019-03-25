function [h, display_array] = displayData(X, example_width)
%DISPLAYDATA Display 2D data in a nice grid
%   [h, display_array] = DISPLAYDATA(X, example_width) displays 2D data
%   stored in X in anice grid. It returns the figure handle h and the
%   displayed array if requested

% Compute rows m and cols n
[m n] = size(X);

% Default width automatically set to square root of width
if ~exist('example_width', 'var') || isempty(example_width)
    example_width = round(sqrt(n));
end

% Computes the height
example_height = (n / example_width);

% Compute the number of items to display
display_rows = floor(sqrt(m));
display_cols = ceil(m / display_rows);

% image padding
pad = 1;

% Setup blank display
display_array = - ones(pad + display_rows * (example_height + pad), ...
                       pad + display_cols * (example_width  + pad));

% Copy each example into a patch on the display array

% Gray Image
% colormap (map) sets the current colormap to map
% gray is a builtin colormap traversing black to 
% white in shades of gray.
colormap(gray);

% Display Image
h = imagesc(display_array, [-1 1]);

end