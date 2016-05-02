%SEGMENTIMAGE
%   This function separates the foreground regions in the fringerprint
%   image from the background. The foreground is the area of interest.

function [mask] = segmentImage(img, window)
%% Verifying the number of inputs
if nargin ~= 2
    error('Number of arguments MUST be equal 2');
end
%% Converting the image values in a double
if ~isa(img, 'double')
    img = double(img);
end
%% Calculating the variance of the image which it will be used as a threshold
threshold = var(img(:),1);
if threshold >= 0.1
    threshold = threshold/100;
end
%% Segmenting the image and creating the mask
[row,col] = size(img);
mask = ones(row,col);
for i=1:row/window
    r = [1+(i-1)*window,i*window];
    for j=1:col/window        
        c = [1+(j-1)*window,j*window];
        block = img(r(1):r(2),c(1):c(2));
        if var(block(:),1) < threshold
            mask(r(1):r(2),c(1):c(2)) = 0;
        end
    end
end
%% Adjusting the size of the image according the window
x = mod([row,col],window);
if x(1) ~= 0    %including news rows if it isn't multiple of window
    mask(row - x(1):row, :) = 0;
end
if x(2) ~= 0    %including news cols if it isn't multiple of window
    mask(:, col - x(2):col) = 0;
end
%% Applying close and opening operations.
% These operations will make holes dissapear and the mask will be more
% uniform
se = strel('disk', 5, 0);
mask = imclose(mask,se);
mask = imopen(mask,se);
end

