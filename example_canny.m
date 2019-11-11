clear all
clc
img = imread('./data/zebra_GT.png');
% img = imread('./data/building.jpg');
% img = imread('./data/cave_flash.jpg');
% img = imread('./data/cave_noflash.jpg');
% img = imread('./data/kate.png');
% img = imread('./data/library.png');
% img = imread('./data/monkey.jpg');
% img = imread('./data/lena.jpg');
% img = imread('./data/barbara.png');

%%
option.sigma = 2; % try 1, 2
option.maxVal = 30;  
option.minVal = 75; 
res = canny(img, option);
imshow(res);