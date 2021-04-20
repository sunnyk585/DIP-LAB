clc; clear; close all;
%Edge Detection
%% Inporting an Image
Image = imread('abc.jpg');
Image = imresize(Image, 0.5);
Image = rgb2gray(Image);
figure(1);
imshow(Image);
%% Edges by using DWT2
[cA, cH, cV, cD] = dwt2(Image,'haar');
figure(2);
subplot(2,2,1); imshow(uint8(cA));
subplot(2,2,2); imshow(uint8(cH));
subplot(2,2,3); imshow(uint8(cV));
subplot(2,2,4); imshow(uint8(cD));
%% Edges by using Canny
Edge_Canny = edge(Image,'canny');
figure(3);
imshow(Edge_Canny);
title("Edges by using Canny");
%% Edges by using Sobel
Edge_Sobel = edge(Image,'sobel');
figure(4);
imshow(Edge_Sobel);
title("Edges by using Sobel");