%ESTIMATEORIENTATIONFIELD - estimate the orientation field of a fingerprint
%image using the Least Mean Square Method in a pixel-wise scheme, which
%produces an accurate estimantion.
%
% Usage:    [orientationField] = estimateOrientationField(normalizedImage,
% gaussianFilterSize, sigma);
%
% Arguments:    img                 - a normalized fingerprint image
%               gaussianFilterSize  - size of the Gaussian Filter
%               sigma               - standard deviation to be used in
% Gaussian Filter
% 
% Return:       orientationField    - The orientation field in radians
% 
% Adapted from Raymond Thai, "Fingerprint Image Enhacement and Minutiae
% Extraction" section 2.2.3

function [ orientationField ] = estimateOrientationField(img, gaussianFilterSize, sigma)

% HORIZONTAL_SOBEL_OPERATOR   = [1 0 -1; 2 0 -2; 1 0 -1];
% VERTICAL_SOBEL_OPERATOR     = [1 2 1; 0 0 0; -1 -2 -1];   

%% Computing the gradients Gx and Gy for each pixel in the block using Sobel operator
h = fspecial('sobel');
% [fx, fy] = gradient(h);
Gx = filter2(h,img);    %Gradient magnitude in the X direction
Gy = filter2(h',img);   %Gradient magnitude in the Y direction

%% Computing the orientation field of the normalized image
Vx = 2*Gx.*Gy;
Vy = (Gx.^2).*(Gy.^2);
orientationField = 1/2*atan(Gy./Gx);

%% Smoothing the orientation field in a local neighbourhood using Gaussian Filter
thetaX = cos(2*orientationField);
thetaY = sin(2*orientationField);
h = fspecial('gaussian',gaussianFilterSize,sigma);
thetaX = filter2(h,thetaX);
thetaY = filter2(h,thetaY);

orientationField = 1/2*atan(thetaY./thetaX);
end

