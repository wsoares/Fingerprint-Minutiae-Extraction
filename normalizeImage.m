%NORMALIZEIMAGE - standardise the intensity values in an image by adjusting
%the range of grey-level values so that it lies within a desired range of 
%values.
% 
%Usage:    normalizedImage = normalizeImage(originalImage, desiredMean, desiredVar)
% 
%Arguments:    originalImage   - Fingerprint image
%              desiredMean     - Mean value
%              desiredVar      - Variance value
% 
%Returns:      normalizedImage - Normalized image values to desired mean
%and variance
% 
%Adapted from Raymond Thai, "Fingerprint Image Enhacement and Minutiae
%Extraction" section 2.2.2

function [ normalizedImage ] = normalizeImage(originalImage, desiredMean, desiredVar)

%% Verifing the number of inputs
if nargin ~= 3
    error('Number of arguments MUST be equal 3');
end

%% Estimation of normalization
originalImage = double(originalImage);
meanImage = mean(originalImage(:));
normalizedImage = (originalImage - meanImage)/std(originalImage(:));
normalizedImage = normalizedImage*sqrt(desiredVar);
m = find(originalImage <= meanImage);
p = find(originalImage > meanImage);
normalizedImage(m) = desiredMean - normalizedImage(m);
normalizedImage(p) = desiredMean + normalizedImage(p);
end

