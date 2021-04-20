clc;clear;close all;
%Histogram Stretching
Sminimum = 20;
Smaximum = 255;
I = imread('abc.jpg');
I_gray = rgb2gray(I);
[row col] = size(I_gray); % Size of the gray image
len = row * col; % Total number of pixels
I_vec = I_gray(:); % Vectorising matrix
I_sort = sort(I_vec); % Sorting the values in ascendingvalues
I_unq = unique(I_sort); % Finding unique values
Iminimum = min(I_unq);
Imaximum = max(I_unq);
% Slope of the image
Slope = (Smaximum-Sminimum)./(Imaximum-Iminimum);
S_new = Slope.*(I_unq-Iminimum)+Sminimum;
% Stretching the image
I_stretched = zeros(row,col);
for jj = 1:length(I_unq)
I_stretched(I_gray == I_unq(jj)) = S_new(jj);
end
I_stretched = uint8(I_stretched);
figure;
subplot(2,2,1)
imshow(I_gray)
title('Original')
subplot(2,2,2)
imshow(I_stretched)
title('After Stretching')
subplot(2,2,3)
histogram(I_gray)
title('Histogram for Original Image')
subplot(2,2,4)
histogram(I_stretched)
title('Histogram after Stretching')