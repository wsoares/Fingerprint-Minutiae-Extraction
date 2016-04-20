%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This script is for testing the normalizeImage.m function. The goal here
%   is to find out the best values for mean and variance as possible.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; clc;


im = imread('101_1.tif');
subplot(3,3,1),imshow(im),title('original image');
subplot(3,3,4),imshow(im),title('original image');
subplot(3,3,7),imshow(im),title('original image');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Testing for desired mean = 100 and desired variance = 100. These values
%   were found out in Handbook of Fingerprint Recognition, page 133. THIS
%   DIDN'T WORK
%nrmlzd_100_100 = normalizeImage(im, 100, 100);
%subplot(2,3,2),imshow(nrmlzd_100_100),title('normalized image for m=100 and v=100');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Testing for m=0 and v=1

nrmlzd_0_1 = mat2gray(normalizeImage(im, 0, 1));
subplot(3,3,2),imshow(nrmlzd_0_1),title('normalized image for m=0 and v=1');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Testing for desired mean = 0,7 and desired variance = 0,5. These values
%   were found out in Identificaçao de Impressoes Digitais baseada na
%   extraçao de minucias, page 37

nrmlzd_07_05 = mat2gray(normalizeImage(im, 0.7, 0.5));
subplot(3,3,3),imshow(nrmlzd_07_05),title('normalized image for m=0,7 and v=0,5');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Testing for m=0.5 and v=0.5


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Testing for m=0.5 and v=0.2

nrmlzd_05_02 = mat2gray(normalizeImage(im,0.5,0.2));
subplot(3,3,6), imshow(nrmlzd_05_02), title('normalized image for m=0,5 and v=0.2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Testing for m=0.5 and v=1

nrmlzd_05_1 = mat2gray(normalizeImage(im,0.5,1));
subplot(3,3,8), imshow(nrmlzd_05_1), title('normalized image for m=0,5 and v=1');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Testing for m=128 and v=74

nrmlzd_1_1 = mat2gray(normalizeImage(im,1,0));
subplot(3,3,9), imshow(nrmlzd_1_1), title('normalized image for m=1 and v=0');

