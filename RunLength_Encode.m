clc;clear;close all;
%Run Length Encoding
%% Taking random binary input bits
flow= input('Input "1" for User input Array or \nInput "2" for Randomly Generated array of length 100 \nas input to RLE ?\n');
if flow ==1
x= input('Enter array ');
elseif flow ==2
x = round(0.75*rand(1,100)); %Random integer from 0 or 1 array of length 100
else
disp("Enter input");
end
%% Declearing Vairables
y=[]; %output array
count=1; %counting the occurance
%% RLE Algorithm using For Loop For each bit Checking Current bit with previous bit
for i=1:length(x)-1
if(x(i)==x(i+1)) %if equal increment count
count=count+1;
else
y=[y,count,x(i),];% else add elements to output and check for next bit
count=1; %reset count
end
end
%% Output
y=[y,count,x(length(x))]; %to avoid index exceedning adding last element seperately Compression Ratio
lengthip=length(x);
lengthop=length(y);
z=lengthip/lengthop;
%% Displaying
disp("Input bits are");
disp(x);
disp("RLE output bits are");
disp(y);
if z>1
disp("Compression positive");
disp("Compression Ratio is");
disp(z);
elseif z==1
disp("No Compression");
else
disp("Compression negative");
end