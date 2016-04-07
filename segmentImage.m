%SEGMENTIMAGE
%   This function separates the foreground regions in the fringerprint
%   image from the background. The foreground is the area of interest.

function [sgmtd_img] = segmentImage( img )

window = 20;
sgmtd_img = img;
img = double(img);
bw = ones(size(img));
[row,col] = size(img);
threshold = var(img(:),1);  %calculating the global variance

if threshold >= 0.1
    threshold = threshold/100;
end

for i=1:row/window
    r = [1+(i-1)*window,i*window];
    for j=1:col/window        
        c = [1+(j-1)*window,j*window];
        block = img(r(1):r(2),c(1):c(2));
        if var(block(:),1) < threshold
            sgmtd_img(r(1):r(2),c(1):c(2)) = 0;
            bw(r(1):r(2),c(1):c(2)) = 0;
        end
    end
end
end

