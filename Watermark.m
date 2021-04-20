clc; clear; close all;
%WaterMark
%% Taking Input Images
Image = rgb2gray(imread('abc.jpg'));
Image = imresize(Image, 0.5);
imshow(Image);
WaterMark = imread('abc.png');
WaterMark = padarray(WaterMark, 213, 0,'pre');
%% Performing Bit Slicing
Image_Bit_Sliced = bitand(Image, 248); %% Taking first 5 MSB bits
WaterMark_Bit_Sliced = bitsrl(WaterMark, 5); %% Taking first 3 MSB bits
Final_Image = bitor(Image_Bit_Sliced, WaterMark_Bit_Sliced);
figure(1);
imshow(Final_Image);
% Recovering the watermark
Recovered_Water_Mark = bitsll(Final_Image, 5);
figure(2);
imshow(Recovered_Water_Mark);
%% Performing DWT2
[cAI, cHI, cVI, cDI] = dwt2(Image, 'haar');
[cAWM, cHWM, cVWM, cDWM] = dwt2(WaterMark, 'haar');
cA = 0.8*cAI + 0.2*cAWM;
Final_Watermarked_Image = idwt2(cA, cHI, cVI, cDI, 'haar');
figure(3);
imshow(uint8(Final_Watermarked_Image));
% Recovering the watermark
[cA, cH, cV, cD] = dwt2(Final_Watermarked_Image, 'haar');
cA = (cA - 0.8*cAI)/0.2;
Final_Recovered_Image = idwt2(cA, cHWM, cVWM, cDWM, 'haar');
figure(4);
imshow(uint8(Final_Recovered_Image));