function [ normalizedImage ] = normalizeImage( originalImage )
%NORMALIZEIMAGE Summary of this function goes here
%   Normalisation is used to standardise the intensity values in an image
%   by adjusting the range of grey-level values so that it lies within a
%   desired range of values. The method applied here is the same presented
%   by Thai in his report. Look at the section 2.2.2 and 2.3.3.

%% Desired mean and variance values
desiredMean = 0;
desiredVar = 1;

%% Estimation of mean and variance of originalImage
[row col] = size(originalImage);
vectorImage = im2single(reshape(originalImage', 1, row*col)); %   Converting the originalImage in a vector with single values
varImage = var(vectorImage,1);
meanImage = mean(vectorImage);

%% Estimation of normalization pixel-wise
for r=1 : row
    for c=1 : col
        if originalImage(r,c) > meanImage
            normalizedImage(r,c) = desiredMean + sqrt((desiredVar*(im2single(originalImage(r,c)) - desiredMean)^2)/varImage);
        else
            normalizedImage(r,c) = desiredMean - sqrt((desiredVar*(im2single(originalImage(r,c)) - desiredMean)^2)/varImage);
        end
    end
end
normalizedImage = mat2gray(normalizedImage);
end

