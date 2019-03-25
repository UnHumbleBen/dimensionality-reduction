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
curr_ex = 1;
for j = 1:display_rows
    for i = 1:display_cols
        if curr_ex > m,
            break;
        end

        % Get the max value of the patch
        max_val = max(abs(X(curr_ex, :)));
        curr_rows = pad + (j - 1) * (example_height + pad) + (1:example_height);
        curr_cols = pad + (i - 1) * (example_width  + pad) + (1:example_width );
        curr_reshaped = reshape(X(curr_ex, :), example_height, example_width);
        display_array(curr_rows, curr_cols) = curr_reshaped / max_val;
        curr_ex = curr_ex + 1;
    end
    if curr_ex > m,
        break
    end
end

% Gray Image
% colormap (map) sets the current colormap to map
% gray is a builtin colormap traversing black to 
% white in shades of gray.
colormap(gray);

% Display Image
h = imagesc(display_array, [-1 1]);

% Do not show axis
% "image" forces x distance to equal y distance
% and fixes axes to the limits of the data
% "off" turns of tic marks
axis("image", "off");

% Flushes figure window
drawnow;

end