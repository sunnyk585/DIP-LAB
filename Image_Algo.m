clc;clear;close all;
%Image Algorithm
% Displaying original Image
Image = imread('abc.jpg');
Image = rgb2gray(Image);
imshow(Image);
title('Original Image');
% Padding 0 to all side of the Image
H = size(Image,1); %Height of Image
W = size(Image,2); %Width of Image
I_PadZero = [zeros(H,1),Image,zeros(H,1)];
I_PadZero = [zeros(1,W+2);I_PadZero;zeros(1,W+2)];
% Implementing the Algorithm
I_New = zeros(H,W);
for Row = 1:H
for Col = 1:W
CurrRow = Row+1; %Saving Row and Current Value
CurrCol = Col+1;
CurrPixel = I_PadZero(CurrRow,CurrCol);
NewPixel = 1*(CurrPixel<I_PadZero(CurrRow,CurrCol+1))+...
2*(CurrPixel<I_PadZero(CurrRow-1,CurrCol+1))+...
4*(CurrPixel<I_PadZero(CurrRow-1,CurrCol))+...
8*(CurrPixel<I_PadZero(CurrRow-1,CurrCol-1))+...
16*(CurrPixel<I_PadZero(CurrRow,CurrCol-1))+...
32*(CurrPixel<I_PadZero(CurrRow+1,CurrCol-1))+...
64*(CurrPixel<I_PadZero(CurrRow+1,CurrCol))+...
128*(CurrPixel<I_PadZero(CurrRow+1,CurrCol+1)); %Calculating new value of pixel
I_New(Row,Col) = NewPixel;
end
end
I_New = uint8(I_New); %Convert to Unsigned 8-Bit Data Type
% Comparison of Original and Resultant Image
figure(2);
subplot(1,2,1);
imshow(Image);
title('Original Image');
subplot(1,2,2);
imshow(I_New);
title('After Applying Algorithm');