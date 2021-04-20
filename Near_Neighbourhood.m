clc;clear;close all;
% Near Neighbourhood
%% Input Image
I = imread('abc.jpg');
I = rgb2gray(I);
imshow(I);
title('Original Image');
%% Padding zeros in the image matrix
H = size(I,1);
W = size(I,2);
padded_img = [zeros(H,1),I,zeros(H,1)];
padded_img = [zeros(1,W+2);padded_img;zeros(1,W+2)];
%% Near Neighbourhood Algorithm
image_new = zeros(H,W);
for row = 1:H
for col = 1:W
row_init = row+1;
col_init = col+1;
curr_pix = padded_img(row_init,col_init);
new_pix = 1*(curr_pix<padded_img(row_init,col_init+1))+...
2*(curr_pix<padded_img(row_init-1,col_init+1))+...
4*(curr_pix<padded_img(row_init-1,col_init))+...
8*(curr_pix<padded_img(row_init-1,col_init-1))+...
16*(curr_pix<padded_img(row_init,col_init-1))+...
32*(curr_pix<padded_img(row_init+1,col_init-1))+...
64*(curr_pix<padded_img(row_init+1,col_init))+...
128*(curr_pix<padded_img(row_init+1,col_init+1));
image_new(row,col) = new_pix;
end
end
image_new = uint8(image_new);
%% Plotting the output
figure(2);
imshow(image_new);
title('Image After Applying the Algorithm');