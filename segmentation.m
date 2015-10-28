function [sgmtd_img bw]= segmentation( img )
%SEGMENTATION Summary of this function goes here
%   This function separates the foreground regions in the fringerprint
%   image from the background. The foreground is the area of interest.

window = 20;
sgmtd_img = img;
bw = ones(size(img));
tmp_img = im2single(img);   %converting the pixels values to single
[row,col] = size(tmp_img);

%calculating the global variance
threshold = var(reshape(tmp_img',1,row*col),1);

if threshold >= 0.1
    threshold = threshold/100;
end
% threshold = 0.022;

for i=1:row/window
    for j=1:col/window
        r = [1+(i-1)*window i*window];
        c = [1+(j-1)*window j*window];
        block = tmp_img(r(1,1):r(1,2),c(1,1):c(1,2));
        block = reshape(block',1,window^2); %converting the matrix into a vector so that the variance can be calculated
        if var(block,1) <= threshold
            sgmtd_img(r(1,1):r(1,2),c(1,1):c(1,2)) = 0;
            bw(r(1,1):r(1,2),c(1,1):c(1,2)) = 0;
        end
%         mean_block = mean(reshape(block',1,window^2));
%         for k=1:window
%             for l=1:window
%                 variance = (block(k,l) - mean_block)^2;
%             end
%         end
%         variance = variance/(window^2);
%         if variance < 0.01
%             sgmtd_img(r(1,1):r(1,2),c(1,1):c(1,2)) = 0;
%         end
    end
end
end

