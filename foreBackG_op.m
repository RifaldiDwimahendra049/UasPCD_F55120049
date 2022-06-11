clc;
clear;
close all;

img = imread('rawit.jpg');

gray = rgb2gray(img);

bw = imbinarize(gray,110/255);
bw = imcomplement(bw);
bw = imfill(bw, 'holes');
bw = bwareaopen(bw,50);

str = strel('disk', 5);
bw = imerode(bw, str);

img2 = imread('bg1763.jpg');
img2_re = imresize(img2,[360,640]);


R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

R2 = img2_re(:,:,1);
G2 = img2_re(:,:,2);
B2 = img2_re(:,:,3);

R2(bw) = R(bw);
G2(bw) = G(bw);
B2(bw) = B(bw);

RGB = cat(3,R2,G2,B2);

subplot(1,2,1), imshow(img),title('Citra Original');
subplot(1,2,2), imshow(RGB),title('Citra Output');