%%Process of extraction minutiae from a poor quality fingerprint image
%%using the methodology applied by Raymond Thai.

img = imread('101_1.tif');
mask = zeros(size(img));
mask(120:240,120:320) = 1;
bw = activecontour(img,mask,700);
[sgmtd_img bw2] = segmentation(img);
newimg = and(bw,img);

img2 = imread('fingerprint.tif');
mask = zeros(size(img2));
mask(120:240,120:320) = 1;
bw3 = activecontour(img2,mask,700);
[sgmtd_img2 bw4] = segmentation(img2);
newimg2 = and(bw3,img2);

img3 = imread('fingerprint2.tif');
mask = zeros(size(img3));
mask(120:240,120:320) = 1;
bw5 = activecontour(img3,mask,700);
[sgmtd_img3 bw6] = segmentation(img3);
newimg3 = and(bw5,img3);

%%ploting the results
subplot(3,5,1),imshow(img), title('original image');
subplot(3,5,2),imshow(bw), title('segmented image using activecontour');
subplot(3,5,3),imshow(bw2), title('segmented image using Thai method');
subplot(3,5,4),imshow(sgmtd_img), title('Final result w/ Thai method');
subplot(3,5,5),imshow(newimg), title('Final result w/ operation AND between bw and img');

subplot(3,5,6),imshow(img2), title('original image');
subplot(3,5,7),imshow(bw3), title('segmented image using activecontour');
subplot(3,5,8),imshow(bw4), title('segmented image using Thai method');
subplot(3,5,9),imshow(sgmtd_img2), title('Final result w/ Thai method');
subplot(3,5,10),imshow(newimg2), title('Final result w/ operation AND between bw3 and img2');

subplot(3,5,11),imshow(img3), title('original image');
subplot(3,5,12),imshow(bw5), title('segmented image using activecontour');
subplot(3,5,13),imshow(bw6), title('segmented image using Thai method');
subplot(3,5,14),imshow(sgmtd_img3), title('Final result w/ Thai method');
subplot(3,5,15),imshow(newimg3), title('Final result w/ operation AND between bw5 and img3');