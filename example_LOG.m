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
thre = 300;
res= LOG(img, thre);
imshow(res);