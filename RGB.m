clc;clear;close all;
%Red Green Blue
orginal_image = imread('abc.jpg');
red = orginal_image; %Red Image
red(:,:,2) = 0;
red(:,:,3) = 0;
green = orginal_image; %Green Image
green(:,:,1) = 0;
green(:,:,3) = 0;
blue = orginal_image; %Blue Image
blue(:,:,1) = 0;
blue(:,:,2) = 0;
imshow(orginal_image)
figure(1)
subplot(311);
imshow(red)
subplot(312);
imshow(green)
subplot(313);
imshow(blue)