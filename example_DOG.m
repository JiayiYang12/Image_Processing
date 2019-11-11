clear all
clc
%% Load images
% img = imread('./data/zebra_GT.png');
% img = imread('./data/building.jpg');
% img = imread('./data/cave_flash.jpg');
% img = imread('./data/cave_noflash.jpg');
% img = imread('./data/kate.png');
 img = imread('./data/library.png');
% img = imread('./data/monkey.jpg');
% img = imread('./data/lena.jpg');
% img = imread('./data/barbara.png');

%%
option.outer_sigma = 0.8;
option.inner_sigma = 0.1;
res= DOG(img, option);
imshow(res);