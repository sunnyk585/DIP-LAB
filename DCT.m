clc; clear all; close all;
%Zig Zag DCT
%% Initialising the variables
image = rgb2gray(imread('abc.jpg'));
vmaximum = size(image, 1);
hmaximum = size(image, 2);
vminimum = 1;
hminimum = 1;
v = vminimum;
h = hminimum;
output = zeros(1, vmaximum*hmaximum);
%% Algorithm for the zig zag pattern
i = 1;
while ((v <= vmaximum) && (h <= hmaximum))
if (mod(h + v, 2) == 0) % going up
if (v == vminimum)
output(i) = image(v, h); % if we get the first line
if (h == hmaximum)
v = v + 1;
else
h = h + 1;
end
i = i + 1;
elseif ((h == hmaximum) && (v < vmaximum)) % if we get to the last column
output(i) = image(v, h);
v = v + 1;
i = i + 1;
elseif ((v > vminimum) && (h < hmaximum)) % all other cases
output(i) = image(v, h);
v = v - 1;
h = h + 1;
i = i + 1;
end
else % going down
if ((v == vmaximum) && (h <= hmaximum)) % if we get to the last line
output(i) = image(v, h);
h = h + 1;
i = i + 1;
elseif (h == hminimum) % if we gett to the first column
output(i) = image(v, h);
if (v == vmaximum)
h = h + 1;
else
v = v + 1;
end
i = i + 1;
elseif ((v < vmaximum) && (h > hminimum)) % all other cases
output(i) = image(v, h);
v = v + 1;
h = h - 1;
i = i + 1;
end
end
if ((v == vmaximum) && (h == hmaximum)) % bottom right element
output(i) = image(v, h);
imshow(image);
break
end
end