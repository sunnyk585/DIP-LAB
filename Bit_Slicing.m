clc;clear;close all;
%Bit Plane Slicing
Image = imread('abc.jpg');
Image = rgb2gray(Image);
imshow(Image);
title('Original Image');
figure(2);
for i = 1:8
subplot(2,4,i);
nth = bitand(Image,2^(8-i));
x= power(2,8-i); %For 1 and 0
nth = double(nth/x);
imshow(nth);
title(strcat('Bit Plane-',num2str(9-i)));
end
% Removing the Least Significant Bit
RLSB = bitand(Image,254); %LSB is forcefully put to 0 by using AND operation with '11111110'
figure(3)
subplot(1,2,1);
imshow(Image);
title('Original Image');
subplot(1,2,2);
imshow(RLSB);
title('Least Significant Bit Removed Image');