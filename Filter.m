clc; clear all; close all;
%Filter Designing
%% Importing an Image
Image = imread('abc.jpg');
Image = imresize(Image, 0.5);
Image = rgb2gray(Image);
figure(1);
imshow(Image);
%% Designing a Filter
HPF = [-1,-1,-1;-1,8,-1;-1,-1,-1]; %Simple Laplacian Mask
LPF = [1,1,1;1,1,1;1,1,1] .* (1/9); %Averaging filter mask
%% Applying the Filters
I_HPF = conv2(Image,HPF);
I_LPF = conv2(Image,LPF);
figure(2);
subplot(1,2,1); imshow(uint8(I_HPF));
subplot(1,2,2); imshow(uint8(I_LPF));