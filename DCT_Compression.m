clc;clear all;close all
%DCT Image Compression
[x,y] = uigetfile('*.jpg*','select the grayscale image'); % here ...x=filename;y=pathname
filewithpath=strcat(y,x);
imgtemp =imread(filewithpath);
originalimage=imgtemp;
img=originalimage;
%checking for colored image
imgr = rgb2gray(originalimage);
figure
imshow(img)
title('original image')
imwrite(img,'org.jpg')
data= size(img,2);
samplesdivideeighth =(data /8);
coloumn8 = [];
for colour=1:3 %color layer
for i=1:size(img,1)
rowwise = dct(double(img(i,:,colour)));
coloumn8(i,:,colour)= idct(rowwise(1:samplesdivideeighth),data);
end
end
dat2 =size(img,1);
samplesEighth=floor(data/8);
coloumn8f=[];
for k=1:3 %all color layer
for i=1:size(img,2) %all coloumn
DCT8 = dct(double(coloumn8(:,i,k)));
coloumn8f(:,i,k)= idct(DCT8('1:samplesEighth),dat2'));
end
end
dct1 =(uint8('coloumn8'));
%dct 1=rgb2gray(dct 1);
figure
imshow(dct1)
title('COMPRESSED IMAGE');
imwrite(dct1,'OUT.jpg')